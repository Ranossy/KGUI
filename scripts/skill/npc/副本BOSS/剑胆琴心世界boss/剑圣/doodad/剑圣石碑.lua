---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/剑胆琴心世界boss/剑圣/doodad/剑圣石碑.lua
-- 更新时间:	2015/10/9 9:44:02
-- 更新用户:	WANGZEYU
-- 脚本说明:
----------------------------------------------------------------------<
-- 在玩家点击DOODAD的时候触发
function OnOpen(doodad, player)
	-- 必须要有一个返回值来确定是否允许玩家打开此DOODAD
	local scene = player.GetScene()
	if not scene then
		return
	end
	local Jiansheng = scene.GetNpcByNickName("Shijie_Jiansheng")
	if Jiansheng then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(8, 5375), 4)
		player.SendSystemMessage(GetEditorString(8, 5375))
		return false
	end
	player.DoAction(0, 10102)
	player.DoCustomOTAction(0, 1, 5 * GLOBAL.GAME_FPS, TARGET.DOODAD, doodad.dwID, "scripts/skill/npc/副本BOSS/剑胆琴心世界boss/剑圣/doodad/剑圣石碑.lua", GetEditorString(8, 5376))
	return false
end

function OnCustomEvent(player, doodad)
	local scene = player.GetScene()
	if not scene then
		return
	end

	scene.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/npc/副本BOSS/剑胆琴心世界boss/剑圣/doodad/剑圣石碑.lua", player.dwID, 1)

	return
end

function OnTimer(scene, nParam1, nParam2)
	local Shibei = scene.GetDoodadByNickName("JianshengShibei")
	local playertarget = GetPlayer(nParam1)
	if playertarget and nParam2 == 1 then
		if Shibei and Shibei.GetCustomInteger1(1) == 0 then
			scene.CreateNpc(46402, 111946, 77973, 1086400, 128, -1, "Shijie_Jiansheng")
			scene.CreateNpc(47094, 111946, 77973, 1086400, 128, -1, "ShijieJiansheng_SkillControl")
			scene.CreateNpc(47095, 111946, 77973, 1086400, 128, -1, "ShijieJiansheng_AreaControl")
			Shibei.SetCustomInteger1(1, 1)
		end
	end
end

-- 在玩家操作DOODAD进度条被打断时触发
--function OnBreak(doodad, player)
--end

-- 在玩家操作DOODAD进度条走完时触发
--function OnPick(doodad, player)
--end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com