# Migrating emails from Google account to another Google account

* Google Workspace account test.user@domain.com was migrated to another Google Workspace account.
* Source: Check emails from other accounts
  * https://support.google.com/mail/answer/21289?co=GENIE.Platform%3DDesktop&hl=en
* Source: Read Gmail messages on other email clients using POP
  * https://support.google.com/mail/answer/7104828?hl=en

1. Turn on these settings on account test.user@domain.com
    * **Enable POP for all mail**, check that keep copy is selected.
      * Gmail -> Settings -> Forwading and POP/IMAP
    * **Less secure app access**
      * Manage your Google Account -> Security -> There should be section to enable **Less secure app access**. If one is using 2FA, an App password needs to be created.
1. With the destination account select in Gmail settings, Accounts -> Check mail from other accounts, Add a mail account
~~~
Email address: test.user@domain.com
Username: test.user
Password: xxx
POP Server: pop.gmail.com
Port: 995

Uncheck, Leave a copy of retrieved message on the server. If checked, there's error "pop.gmail.com does not support leaving messages on the server". The
Check, Always use a secure connection (SSL) when retrieving mail.
Check, Label incoming messages: <whatever one chooses>
Uncheck, Archive incoming messages (Skip the Inbox)
~~~
