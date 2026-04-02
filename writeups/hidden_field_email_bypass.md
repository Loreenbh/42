# Hidden Field Email Bypass / Client-Side Trust Issue

## Description
The "Forgot Password" feature only provides a "Send" button, without any visible field to enter an email address.

By inspecting the page source, I found a hidden input field that defines the recipient email:

```html
<input type="hidden" name="mail" value="webmaster@borntosec.com">
```
Although this field is hidden in the browser, it can still be modified by the user.

## Exploitation
To test this, I modified the `mail` parameter before sending the request:
```bash
curl -X POST "http://192.168.56.4/index.php?page=forgot_password" \
     -d "mail=test@test.com&Submit=Submit"
```
The application accepted the modified value and sent the password recovery email to the attacker-controlled address.

## Impact
- Sensitive information disclosure
- Abuse of the password recovery feature
- Potential account compromise

## Remediation
 Do not store sensitive values in hidden form fields
- Define sensitive parameters on the server side only
- Never trust client-controlled input for security decisions
Example (server-side handling):
```PHP
$mail = "webmaster@borntosec.com";
```

## Conclusion
This issue shows that hidden fields are not secure, as they can be easily modified by the user. Trusting them for sensitive actions can lead to abuse.

![Flag](../images/email_bypass.png)

