---------------------------------------------------------------------->
-- 脚本名称:	F:/zhugan/client/scripts/skill/装备/剑纯特殊武器_道具脚本.lua
-- 更新时间:	2013/1/30 14:27:42
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)
	--player.ClearCDTime(455)
	--print("aaa")
	if player.GetBuff(7913,0) then
		return false, false, false
	end
	local t = player.CastSkill(5209, 1)
	if t ~= 1 then
		--player.ClearCDTime(455)
		return false, false, true
	else
		local npc = player.GetSelectCharacter()
		if not npc then
			return
		end
		local X1, Y1 = player.nX, player.nY
		local X2, Y2 = npc.nX, npc.nY 
		local nRad = math.atan((Y1 - Y2) / (X1 - X2)) * 256 / (math.pi * 2)
		local nFace = 0
		if X1 <= X2 then
			nFace = nRad
		else
			nFace = nRad + 128
		end
		player.TurnTo(nFace)
		if not IsPlayer(npc.dwID) then
			npc.AddBuff(0, 99, 5205, 1, 2)
		end
		player.ResetCD(455)
		player.SetTimer(2.5 * GLOBAL.GAME_FPS, "scripts/Skill/装备/剑纯特殊武器_道具脚本.lua", 0, 1)
		player.PlayCameraAnimation(47, 0)
		player.AddBuff(0,99,5213,1,1)
	end
	return false, false
end
function OnTimer(player, nParam1, nParam2)
	if nParam2 == 1 then
		RemoteCallToClient(player.dwID, "EnableColorShift", true)
		RemoteCallToClient(player.dwID, "SetColorShift", 6)
		player.SetTimer(2 * GLOBAL.GAME_FPS, "scripts/Skill/装备/剑纯特殊武器_道具脚本.lua", 0, 2)
	elseif nParam2 == 2 then
		RemoteCallToClient(player.dwID, "EnableColorShift", false)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com