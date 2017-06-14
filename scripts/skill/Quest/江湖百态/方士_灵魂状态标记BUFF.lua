---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_���״̬���BUFF.lua
-- ����ʱ��:	2016/6/27 15:37:56
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Map/��¹��ԭ/include/�ݵ�����_Data.lh")
--ÿ���Ǿ��飬������
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end

	--С����׼��ʱ�䣬�˻��С����ǰһСʱ��ʼ����С��������ʱ������ֱ���ж��������
	if CastleFight.CheckPrepareTime() then	
		local tActivityMap = CastleFight.GetMapActivityState()
		if tActivityMap[scene.dwMapID] then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(10, 1926), 5)
			player.SendSystemMessage(GetEditorString(10, 1926))
			player.DelBuff(10827, 1)
			if player.GetBuff(11494, 1) then
				player.DelBuff(11494, 1) --ɾ����ʿ��͸��buff
			end
			return
		end
	end
	local nLimitStamina = 2     --ÿ�����֣����ĵľ�����û�о�����ɾ��BUFF
	local nAddExp = 4         --�����ľ�����Ӧ�ľ���
	local nCurrentStamina = player.nCurrentStamina
	if nCurrentStamina < nLimitStamina then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(10, 1442), 3)
		player.SendSystemMessage(GetEditorString(10, 1442))
		player.DelBuff(10827, 1)
		if player.GetBuff(11494, 1) then
			player.DelBuff(11494, 1) --ɾ����ʿ��͸��buff
		end
		return
	end
	player.AddStamina( - nLimitStamina)
	player.SendSystemMessage(GetEditorString(10, 2199))
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end
	IdentifyManager.AddIdentityExp(PLAYER_IDENTITY_TYPE.WIZARD, nAddExp)	--��Ӿ���ɹ�����UpdateIdentityLevel����������������ж��Ƿ��л�λ��
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/��ʿ_����.lua", nCustomValue, 1)	--������������ͳһ�Ľ�������
	--[[
		local scene = player.GetScene()
	if not scene then
		return
	end
	local IdentifyManager = player.GetPlayerIdentityManager()
	if not IdentifyManager then
		return
	end
	local x = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 1)
	local y = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 5)
	local z = IdentifyManager.GetCustomInteger4(PLAYER_IDENTITY_TYPE.WIZARD, 9)
	local mapID = IdentifyManager.GetCustomInteger2(3, 13)
	local nLimitStamina = 2
	if scene.dwMapID == mapID or player.nCurrentStamina < nLimitStamina then    --������������ͳһ�Ľ�������
		if x > 0 and y > 0 and z > 0 then
			player.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/Quest/������̬/��ʿ_����.lua", nCustomValue, 1)	--���������Ļػ�
		end
	end
	--]]
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com