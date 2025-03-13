local roles = {}

function roles.assign()
    role = link.Read("OPCUA@HMI_DataProvider.Users.RoleIdW")
    ret, nameCurrent, levelCurrent = account.GetCurrentLogin()
    if (role == 0) then
        login = account.Login("nologin", "0")
        ret, name, level = account.GetCurrentLogin()
        if(login == 1 and ret == 1 and name == "nologin" and level == 0) then
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 0)   
            user = link.Read("OPCUA@HMI_DataProvider.Users.UserIdW")
            link.Write("OPCUA@HMI_DataProvider.Users.UserStatus", user)   
        else
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 1000)  
        end
    elseif (role == 1) then
        login = account.Login("operator", "1")
        ret, name, level = account.GetCurrentLogin()
        if(login == 1 and ret == 1 and name == "operator" and level == 1) then
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 1)   
            user = link.Read("OPCUA@HMI_DataProvider.Users.UserIdW")
            link.Write("OPCUA@HMI_DataProvider.Users.UserStatus", user)   
        else
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 1001) 
        end
    elseif (role == 2) then
        login = account.Login("technologist", "2")
        ret, name, level = account.GetCurrentLogin()
        if(login == 1 and ret == 1 and name == "technologist" and level == 2) then
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 2)   
            user = link.Read("OPCUA@HMI_DataProvider.Users.UserIdW")
            link.Write("OPCUA@HMI_DataProvider.Users.UserStatus", user)   
        else
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 1002) 
        end
    elseif (role == 3) then
        login = account.Login("service", "3")
        ret, name, level = account.GetCurrentLogin()
        if(login == 1 and ret == 1 and name == "service" and level == 3) then
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 3)   
            user = link.Read("OPCUA@HMI_DataProvider.Users.UserIdW")
            link.Write("OPCUA@HMI_DataProvider.Users.UserStatus", user)
        login = 0
        else
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 1003) 
        end
    elseif (role == 4) then
        login = account.Login("admin", "4")
        ret, name, level = account.GetCurrentLogin()
        if(login == 1 and ret == 1 and name == "admin" and level == 4) then
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 4)   
            user = link.Read("OPCUA@HMI_DataProvider.Users.UserIdW")
            link.Write("OPCUA@HMI_DataProvider.Users.UserStatus", user)   
        else
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 1004) 
        end
    elseif (role == 5) then
        login = account.Login("root", "5")
        ret, name, level = account.GetCurrentLogin()
        if(login == 1 and ret == 1 and name == "root" and level == 5) then
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 5)   
            user = link.Read("OPCUA@HMI_DataProvider.Users.UserIdW")
            link.Write("OPCUA@HMI_DataProvider.Users.UserStatus", user)   
        else
            link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 1005) 
        end
    else
        link.Write("OPCUA@HMI_DataProvider.Users.RoleStatus", 2000)   
    end
    
    ret, name, level = account.GetCurrentLogin()
    link.Write("LEVEL", level)
    link.Write("NAME", name)  
end

return roles
