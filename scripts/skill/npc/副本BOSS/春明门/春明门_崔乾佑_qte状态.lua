---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������/������_��Ǭ��_qte״̬.lua
-- ����ʱ��:	2014/6/17 15:51:05
-- �����û�:	xueyan-pc
-- �ű�˵��:
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		player.SetTimer(4, "scripts/skill/npc/����BOSS/������/������_��Ǭ��_qte״̬.lua", 1, 1)
	end
end

function OnTimer(player, nParam1, nParam2)
	if nParam1 == 1 then
		local buff = player.GetBuff(7902, 1)
		if buff then
			
			if buff.nCustomValue == 0 then
				local randomZZ = math.floor(Random(30000-1) / 10000) + 1
				Prompt(player, randomZZ, 1, 2)
				buff.nCustomValue = randomZZ
				--print(buff.nCustomValue)
				player.SetDynamicSkillGroup(154)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.SetDynamicSkillGroup(0)
end

function Prompt(player, step, stime, z_stime)
	if stime < 18 then
		stime = 18
	end
	z_stime = z_stime * 1000		--����
	local tData =
	{
		[1] = {{nSkillID = 9229, nSkillLevel = 1, szText = GetEditorString(6, 169), szHotKey = "ACTIONBAR1_BUTTON1", nTotalTime = z_stime}},
		[2] = {{nSkillID = 9230, nSkillLevel = 1, szText = GetEditorString(6, 169), szHotKey = "ACTIONBAR1_BUTTON2", nTotalTime = z_stime}},
		[3] = {{nSkillID = 9231, nSkillLevel = 1, szText = GetEditorString(6, 169), szHotKey = "ACTIONBAR1_BUTTON3", nTotalTime = z_stime}},
	}
	local Num = {11, 12, 13}
	if step == 1 then
		RemoteCallToClient(player.dwID, "OnDynamicSkillHighlightChanged", 1, true)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[1])
		player.PlaySound(Num[1])
		player.SetTimer(stime - 1, "scripts/Map/����/ʲô����QTE/QTE-��ʾ.lua", 1, 0)
	elseif step == 2 then
		RemoteCallToClient(player.dwID, "OnDynamicSkillHighlightChanged", 2, true)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[2])
		player.PlaySound(Num[2])
		player.SetTimer(stime - 1, "scripts/Map/����/ʲô����QTE/QTE-��ʾ.lua", 2, 0)
	elseif step == 3  then
		RemoteCallToClient(player.dwID, "OnDynamicSkillHighlightChanged", 3, true)
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "QTEPanel_Show", tData[3])
		player.PlaySound(Num[3])
		player.SetTimer(stime - 1, "scripts/Map/����/ʲô����QTE/QTE-��ʾ.lua", 3, 0)
	end
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com