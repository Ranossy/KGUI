---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_观风殿/协助npc_仇恨转移玩家debuff.lua
-- 更新时间:	2016/8/9 14:59:44
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
 function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
 	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if not scene then
		return
	end
 	
 	local LiFu = scene.GetNpcByNickName("LiFu")
 	local LiChengEn = scene.GetNpcByNickName("LiChengEn")
 	if LiFu then
 		LiFu.DelBuff(11034, 1)
 		LiFu.AddBuff(LiFu.dwID, LiFu.nLevel, 10935, 1)
 	end

 	if LiChengEn then
 		LiChengEn.DelBuff(11034, 1)
 		LiChengEn.AddBuff(LiChengEn.dwID, LiChengEn.nLevel, 10935, 1)
 	end
 end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com