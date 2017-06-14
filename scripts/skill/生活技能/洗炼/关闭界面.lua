---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/生活技能/洗炼/关闭界面.lua
-- 更新时间:	2013/9/12 11:13:38
-- 更新用户:	zhangyan3
-- 脚本说明:	
----------------------------------------------------------------------<

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then 
		return
	end
	
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseEquipMagicChange")
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseEquipMagicChangeBack")
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com