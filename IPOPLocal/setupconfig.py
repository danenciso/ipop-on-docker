# Daniel Enciso
# Sets up the ipop-config file for a specific node
# Takes parameters set by user
import json

# read in ipop configuration file
with open("ipop-config.json","r") as jsonFile:
    data = json.load(jsonFile)

# previous values
prev_username = data["Signal"]["Overlays"]["A0FB390"]["Username"]
prev_pass = data["Signal"]["Overlays"]["A0FB390"]["Password"]
prev_turnaddress = data["LinkManager"]["Turn"][0]["Address"]
prev_turnuser = data["LinkManager"]["Turn"][0]["User"]
prev_turnpass = data["LinkManager"]["Turn"][0]["Password"]
prev_ip = data["BridgeController"]["Overlays"]["A0FB390"]["IP4"]
prev_subnet = data["BridgeController"]["Overlays"]["A0FB390"]["PrefixLen"]

# read in configuration parameters
with open("configParameters.json","r") as jsonFile2:
    data2 = json.load(jsonFile2)

# set new values
data["Signal"]["Overlays"]["A0FB390"]["Username"] = data2["XMPPUser"]
data["Signal"]["Overlays"]["A0FB390"]["Password"] = data2["XMPPPass"]
data["LinkManager"]["Turn"][0]["Address"] = data2["TURNAddr"]
data["LinkManager"]["Turn"][0]["User"] = data2["TURNUser"]
data["LinkManager"]["Turn"][0]["Password"] = data2["TURNPass"]
data["BridgeController"]["Overlays"]["A0FB390"]["IP4"] = data2["IPAddr"]
data["BridgeController"]["Overlays"]["A0FB390"]["PrefixLen"] = data2["PrefixLen"]

# write new information to file
with open("ipop-config.json","w") as jsonFile:
    json.dump(data,jsonFile, indent=2, sort_keys=True)