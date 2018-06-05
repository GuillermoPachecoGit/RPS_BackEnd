var nodemailer = require('nodemailer');


class EmailSender {
    constructor() {
         this.transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
              user: 'rps.software.unicen@gmail.com',
              pass: 'rpssoftware'
            }
        });
        this.administrator_account = 'rps.software.unicen@gmail.com';
     }

     subject() {
         return {
            Analysis : 'RPS Online -Finished  Procrustes Analysis',
            Recovery : 'RPS Online - Recovery password',
            Distance : 'RPS Online -Finished Distance Analysis',
            Ordination : 'RPS Online -Finished Ordination Analysis' 
         }
     }

    sendEmail(mailOptions){
        this.transporter.sendMail(mailOptions, function(error, info){
            if (error) {
              console.log(error);
            } else {
              console.log('Email sent: ' + info.response);
            }
          });
    }
    
    
    generateMailOptions(email_to,subject_title,email_text){
        return {
            from: this.administrator_account,
            to: email_to,
            subject: subject_title,
            text: email_text
        }
    }
        

}
  
module.exports = EmailSender;