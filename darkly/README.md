<div align="center">

<img src="./images/darkly-planche.png" width="100%" />
<br><br>
4 2 P a r i s · D a r k l y

</div>

## 01 — P R O J E C T
Darkly is a web application intentionally designed with 14 different vulnerabilities.
The goal is to identify, analyze, and exploit each flaw to retrieve the associated flag, while learning practical web security techniques.

## 02 — S K I L L S
- Web application vulnerability analysis (SQL Injection, XSS, command injection, etc.)
- Understanding HTTP requests, sessions, and cookies
- File inclusion and server-side logic exploitation
- Browser debugging and request manipulation (DevTools, curl, Burp Suite)
- Documenting technical solutions and attack methodology

## 03 — V U L N E R A B I L I T I E S
1. **Cookie Authentication Bypass** – Manipulating cookies to gain admin access
2. **File Upload Bypass** – Uploading malicious files disguised as images
3. **Header-Based Access Bypass** – Modifying HTTP headers to bypass restrictions
4. **Hidden Directory Discovery** - Accessing hidden folders and files, revealing sensitive information
5. **Hidden Field Email Bypass** - Modifying hidden input fields to redirect sensitive emails
6. **Directory Enumeration & Credential Exposure** - Discovering hidden directories and exposed `htpasswd` files leading to credential compromise.
7. **Local File Inclusion (LFI)** - Reading sensitive server files via directory traversal in the `page` parameter
8. **Cross-Site Scripting (XSS) – Media Page** - Injecting scripts via the `src` parameter in the media page
9. **Open Redirect via `site` Parameter** - Redirecting users to arbitrary URLs by manipulating the `site` parameter
10. **SQL Injection – UNION-Based / Data Extraction** - Extracting database information and sensitive data via UNION-based SQL injection
11. ""
12. **Stored XSS via Feedback Page** – Injecting JavaScript in feedback entries to execute in other users’ browsers.
13. **Survey Input Validation Bypass** – Sending unexpected values to bypass client-side restrictions
14. **Brute Force** – Exploiting lack of protection against repeated login attempts


Each write-up contains:
- A description of the vulnerability
- Steps to exploit it
- Screenshots / proofs of successful exploitation
- Remediation suggestions

## 04 — R E S O U R C E S
- Screenshots and outputs for each vulnerability are stored in the `images/` folder.
- Scripts for payload generation, decoding, or automation can be found in the `resources/` folder.

## 05 — S O U R C E
This repository contains write-ups and documentation only.
No live website, binaries, or sensitive files are included—only proofs, notes, and scripts.
