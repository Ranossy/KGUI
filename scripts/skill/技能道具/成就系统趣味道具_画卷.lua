---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/�ɾ�ϵͳȤζ����_����.lua
-- ����ʱ��:	05/18/10 20:20:28
-- �����û�:	liuhengzhi1
-- �ű�˵��:	
----------------------------------------------------------------------<

Include("scripts/skill/include/strings.ls")
Include("scripts/Include/Player.lh")

function OnUse(player, item, dwSourceBox, dwSourceSlot, dwTargetBox, dwTargetSlot)	
	if not (player.nMoveState == MOVE_STATE.ON_STAND) then
		player.SendSystemMessage(GetEditorString(2, 8380))
		return false, false
	end
	local scene = player.GetScene()
	if not scene then
		return false, false
	end
	
	local doodadTarget = scene.GetDoodadByNickName("zhouzi" .. player.dwID)
	if doodadTarget then
		player.SendSystemMessage(GetEditorString(8, 2173))
		return false, false
	end	
	
	local ndistance
	if player.nGender == 1 then
		ndistance = 50
	else
		ndistance = 0
	end
	
	--	doodadTarget = scene.CreateDoodad(1728, player.nX-50, player.nY, player.nZ, player.nFaceDirection, "zhouzi" .. player.dwID)
	--[[doodadTarget =  CreateDoodadByDirection(scene, 1728, player, 90, ndistance, player.nFaceDirection, "zhouzi" .. player.dwID)
	if not doodadTarget then
		return
	end
	doodadTarget.SetCustomInteger4(0, GetCurrentTime())  --��¼��ǰʱ��
	doodadTarget.SetDisappearFrames(30 * GLOBAL.GAME_FPS, 0)
	player.AddBuff(0, 99, 1593, 1, 1)--]] --�������л�ģ����������Buff
	--player.DoAction(player.dwID, 20961)
	if player.CheckEmotionAction(43) == true then
		player.SendSystemMessage(GetEditorString(8, 2481))
	else
		player.AddEmotionAction(43)
	end
	player.AddBuff(0, 99, 1527, 1, 30)  --������ڼ�ʱ��������BUFF
	return false, true
end

function CreateDoodadByDirection(scene, dwDoodadTemplateID, player, nAngel, nR, nDir, szNickName)
	if player then
		local nX, nY, nZ = player.GetAbsoluteCoordinate()
		if scene then
			local dwAngel = (player.nFaceDirection  * 1.4 -  90) / 180 * 3.14159265 + nAngel
			local createddoodad = scene.CreateDoodad(dwDoodadTemplateID, nX + nR * math.cos(dwAngel), nY + nR * math.sin(dwAngel), nZ, nDir, szNickName)
			--player.AddAchievementCount(1141, 1)
			return createddoodad
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com