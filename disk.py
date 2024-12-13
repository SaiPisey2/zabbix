import psutil

threshold = 20
alert = False
#print("disk partitions ",psutil.disk_partitions())
for part in psutil.disk_partitions():
    #print(part)
    usage = psutil.disk_usage(part.mountpoint)
    #print("usage ",usage)
    free_percentage = (usage.free / usage.total) * 100
    used_percentage = 100 - free_percentage

    if free_percentage < threshold:
        alert = True
        print("1")

if not alert:
    print("0")
