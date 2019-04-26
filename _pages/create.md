---
layout: single
title: Create a Portal
permalink: /gettingstarted/create/
toc: true
toc_sticky: true
toc_label: "Table of Contents"
toc_icon: "cog"

gallery:
  - url: /assets/images/Step1.png
    image_path: /assets/images/Step1.png
    alt: "placeholder image 1"

  - url: /assets/images/Step2.png
    image_path: /assets/images/Step2.png
    alt: "placeholder image 2"

  - url: /assets/images/Step3.png
    image_path: /assets/images/Step3.png

  - url: /assets/images/Step4.png
    image_path: /assets/images/Step4.png
    
  - url: /assets/images/Step5.png
    image_path: /assets/images/Step5.png

  - url: /assets/images/Step6.png
    image_path: /assets/images/Step6.png
    
  - url: /assets/images/Step7.png
    image_path: /assets/images/Step7.png
    
  - url: /assets/images/Step8.png
    image_path: /assets/images/Step8.png
   
  - url: /assets/images/Step9.png
    image_path: /assets/images/Step9.png
  
  - url: /assets/images/Step10.png
    image_path: /assets/images/Step10.png

---

If someone else has already created a Portal for you, you can skip Portal creation. Just point
your browser at the new Portal and perform the initial login as user: <em>admin@chordsrt.com</em>, 
password: <em>realtimedata</em>. You will be prompted to change the password during this first login.
You can then proceed to [Portal configuration]({{site.baseurl}}/admin).

The Portal runs as a standalone web server on Amazon Web Services (AWS). 
The interface to AWS can seem a bit overwhelming (currently offering 52
services!).

We use the **AWS CloudFormation** service to create a new portal. The steps are
simple.

<!--Gallery of picture instructions. This can be moved anywhere.-->
{% include gallery %}


Log onto your AWS account to begin.

## 1. Run CloudFormation

* First click on <em>“Services”</em> and then click on <em>“Cloud Formation”</em> 

<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step1.png"> <!--Using liquid to set path for images.-->
      
## 2. Start stack creation and Specify template 

<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step2.png"><!--Using liquid to set path for images.-->

* Click **Create new stack**

* Click on **Specify Amazon S3 template URL** and Copy and Paste the following link in the box:
<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step3.png"><!--Using liquid to set path for images.-->

``
https://s3-us-west-2.amazonaws.com/chords-template/chords_cf_template.yml
``

* Click **Next**


## 3. Specify the portal name and Key Pair

* Give the stack a name. The convention is _CHORDS-_ suffixed with your project or organization name, e.g. _CHORDS-CSURadar_.
* You will need to create a key pair for your Amazon account if you have not already done so. You can see instructions about how to do this on _Step 4_ of [Setting up your Amazon Account](http://ncar.github.io/chords/aws.html).
Then select an EC2 KeyPair that you created for *KeyName*. This will allow you to ssh into the instance, if ever needed.

For demonstrations and simple, low-bandwidth streaming feeds, select a _t2.micro_ instance type which are free of charge for the first
year. Otherwise, use the default.  
<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step4.png"> <!--Using liquid to set path for images.-->


* Hit **Next**

## 4. Options

* Click **Advanced**
* Scroll down to **Terminal Protection** and select **Enabled**
* Scroll down to **Rollback on Failure** and select **no**

<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step5.png"><!--Using liquid to set path for images.-->
<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step6.png"><!--Using liquid to set path for images.-->

* Hit **Next**.

## 5. Review

* Verify that everything looks good and then click **Create**

<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step7.png"><!--Using liquid to set path for images.-->

## 6. Wait for the portal to be created
* After the creation has started, you will be taken 
to the stack summary page. Go to the *Events* tab to watch the progress 
of the stack creation. It usually takes about 6 minutes to complete, but it can take 
much longer (even 30 minutes), depending upon AWS performance.


<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step8.png"><!--Using liquid to set path for images.-->

## 7. Accessing the new portal

Once your portal is created click on your **Stack Name** then the **“Outputs”** tab. Below it will show a URL for the new portal, **click** on the URL to access your new portal.

<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step9.png"><!--Using liquid to set path for images.-->

## 8. Log Into to Your Brand-New CHORDS Portal!
* Click on the **“Sign in”** 


<img  class="img-responsive" src="{{ site.baseurl }}/assets/images/Step10.png"><!--Using liquid to set path for images.-->

Once the Portal is running, you will want to immediately change the admin acount and password to your
own email and password.

* Log into your new portal, as user: **admin@chordsrt.com**, and password: **realtimedata**.
* Go to the Users link, and change the user name from *admin@chordsrt.com* 
  to your *email address*.
* Logout of the Portal.
* Select **Forgot your password?**
* Enter your email and punch **send me reset password instructions**. 
* An email will be sent, containing a link that you can use to change the password on your account. **It's very likely that this email will go into your spam folder. Use the link to change your password to something secure.**

# If something breaks
* If the provisioning fails, the instance will be stopped, and you won\'t know why. You can redo the process, 
and disable the rollback, so that the instance is left running. To do this, when on the *Options* page, 
open the Advanced section, and change _Rollback on Failure_ to *No*. This will
keep the instance running when the provisioning fails, so that you can ssh in and diagnose the problem.