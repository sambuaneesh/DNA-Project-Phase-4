- fork this repo https://github.com/sambuaneesh/DNA-Project-Phase-4
- clone that repo to your local pc
- execute the following commands in the folder you cloned

```sh
python -m venv dataBased
source dataBased/bin/activate
pip install -r requirements.txt
sudo su
mysql -u root
```

```sql
create database dataBased;
exit
```

```sh
mysql -u root -p dataBased < data.sql
```

- Open the `config.json` file in vscode
  ![](https://i.imgur.com/B7KuIWM.png)
- change the line 3 and line 6
  - line 3 = name of your pc, just open your terminal, it is the name displayed after "@"
  - line 6 = your mysql password

try running the code now

````sh
python cafe.py
	```
````
