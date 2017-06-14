---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������������boss/��ʥ/doodad/��ʥʯ��.lua
-- ����ʱ��:	2015/10/9 9:44:02
-- �����û�:	WANGZEYU
-- �ű�˵��:
----------------------------------------------------------------------<
-- ����ҵ��DOODAD��ʱ�򴥷�
function OnOpen(doodad, player)
	-- ����Ҫ��һ������ֵ��ȷ���Ƿ�������Ҵ򿪴�DOODAD
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
	player.DoCustomOTAction(0, 1, 5 * GLOBAL.GAME_FPS, TARGET.DOODAD, doodad.dwID, "scripts/skill/npc/����BOSS/������������boss/��ʥ/doodad/��ʥʯ��.lua", GetEditorString(8, 5376))
	return false
end

function OnCustomEvent(player, doodad)
	local scene = player.GetScene()
	if not scene then
		return
	end

	scene.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/npc/����BOSS/������������boss/��ʥ/doodad/��ʥʯ��.lua", player.dwID, 1)

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

-- ����Ҳ���DOODAD�����������ʱ����
--function OnBreak(doodad, player)
--end

-- ����Ҳ���DOODAD����������ʱ����
--function OnPick(doodad, player)
--end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com