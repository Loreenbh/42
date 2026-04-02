# Local File Inclusion

## Description

The `page` parameter in the URL is used to include files:

```html
http://192.168.56.4/index.php?page=...
```

## Exploitation

By testing different values, I found the server tries to load the file specified by the user:
```HTML
http://192.168.56.4/index.php?page=../../etc/passwd
```
Feedback messages like `Nope` or `Almost` indicate if the number of `../` sequences is correct. By adjusting directory traversals, sensitive files or the flag can be accessed.


## Impact
- Read sensitive files on the server
- Access system information (e.g., `/etc/passwd`)

## Remediation
- Never include files based directly on user input
- Use fixed paths or whitelist allowed pages:

```python
  if page not in ["home", "about", "contact"]:
    reject request
```
- Block directory traversal patterns like `../`
- Avoid using absolute paths
- Restrict file permissions on sensitive files

## Conclusion

This issue demonstrates that including files based on user input can expose critical system information. Proper input validation and path restrictions are essential to prevent exploitation.

![Flag](../images/local_file_inclusion.png)
