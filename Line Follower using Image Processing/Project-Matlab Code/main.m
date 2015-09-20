%Line follower using PC's serial port
clc                                     % clear the command prompt
disp('wait please');                    % to print a string in command prompt
imaqreset                               % disconnect and delete all image aquisition objects
clear all                             % clear variable and functions from memory
vidobj = videoinput('winvideo',2);      % creates a video input object
set(vidobj,'ReturnedColorSpace','rgb');
set(vidobj,'FramesPerTrigger',1);       % set the property of a object
set(vidobj,'TriggerRepeat',inf);        
triggerconfig(vidobj,'manual');         % configure video input object trigger setting
start(vidobj);                          % Start timer(s) running.


s = serial('COM4', 'BaudRate', 9600);
set(s,'outputbuffersize',10);
fopen(s);

while(1)
  % image=vidobj;
    trigger(vidobj);                    % Manually initiate logging/sending for running object.
    image=getdata(vidobj);
    %image_ycbcr=rgb2ycbcr(image);
    %image_cb=image_ycbcr(:,:,2);
    %image_cr=image_ycbcr(:,:,3);
    [r c d]=size(image);
    output_image=zeros(r,c);
    for i1=1:r
        for i2=1:c
            if (image(i1,i2,1:3)>150)
                output_image(i1,i2)=1;
            else
                output_image(i1,i2)=0;
            end
        end
    end
    
    imshow(output_image)
    [r_cent c_cent]=centroid1(output_image);
    
    total_pix=sum(sum(output_image));
    disp(total_pix);
    if(total_pix<7000)
        
       % stop();
        disp('No Line');
        fwrite(s,'s');
    else
        if (c_cent>200)
       
       %while(c_cent>=150)
       fwrite(s,'l');
       %fwrite(s,'l');
	   disp('left()');
       disp(c_cent);
       disp(r_cent);
       %end 
                                   
        elseif (c_cent<120)
            
            %while(r_cent<130)
            fwrite(s,'r');
            %fwrite(s,'r');
            disp('right()');
            disp(c_cent);
            disp(r_cent);
            %end
            
            
        else
            
           % stop();
           % disp('stop()');
        end

         %if (r_cent<90)
            %fwrite(s,'b');
            %disp('back()');
            %disp(c_cent);
            %disp(r_cent);
             
            
         if (r_cent>120)
             fwrite(s,'f');          
             fwrite(s,'s');
             fwrite(s,'f');
             fwrite(s,'s');
             disp('forward()');
             disp(c_cent);
             disp(r_cent);
            %for t=1:300010000 // for creating delay
            %end
            %t=0;
            %stop();
             
        else
          %  stop();
            fwrite(s,'f');
            disp('forward()');
            disp(c_cent);
            disp(r_cent);
        end
    end
end
fclose(s);
clear s;
            