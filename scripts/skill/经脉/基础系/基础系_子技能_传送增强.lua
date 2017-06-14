---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����ϵ/����ϵ_�Ӽ���_������ǿ.lua
-- ����ʱ��:	2016/5/10 16:56:45
-- �����û�:	kelin-PC
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    : �����������Խű�
-- ������    : zhangqi
-- ����ʱ��  : 2008-07-08
-- ��;(ģ��): ����
-- ��������  : ����ϵ
-- ��������  : ����
-- ����Ч��  : ����
------------------------------------------------

------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/����/����ϵ/����ϵ_����ǧ���ͼID��Ӧ��.lua")

tSkillData =
{
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 1
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 2
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 3
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 4
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 5
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 6
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 7
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 8
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 9
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 10
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 11
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 12
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 13
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 14
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 15
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 16
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 17
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 18
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 19
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 20
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 21
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 22
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 23
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 24
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 25
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 26
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 27
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 28
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 29
	{nMapID = 0, nMapName = "", nCityID = 0}, --level 30
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------

	--	skill.AddAttribute(
	--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--		ATTRIBUTE_TYPE.DASH_FORWARD,
	--		32,
	--		80
	--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����ϵ/����ϵ_�Ӽ���_������ǿ.lua",
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------

	----------------- BUFF��� -------------------------------------------------
	skill.AddSlowCheckSelfBuff(10173, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(10174, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(9982, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 244);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 999999 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 160;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.GetSkillLevel(81) == 0 or player.GetBuff(9982, 1)	then
		return false
	end

	local scene = player.GetScene();
	if not scene then
		return false
	end
	if player.bFightState and scene.nType == MAP_TYPE.DUNGEON then
		player.SendSystemMessage(GetEditorString(3, 9048))
		return false
	end
	if  scene.nType == MAP_TYPE.BATTLE_FIELD then
		player.SendSystemMessage(GetEditorString(3, 9049))
		return false
	end
	if player.GetBuff(7732, 1) then
		player.SendSystemMessage(GetEditorString(6, 4483))
		return false
	end
	if player.GetBuff(7049, 1) then
		player.SendSystemMessage(GetEditorString(6, 871))
	end
	if player.GetBuff(10826, 1) then
		player.SendSystemMessage(GetEditorString(10, 2028))
		return false
	end
	return nPreResult
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--��ȡUI���͹�����cityID��������cityID���mapID
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	local bResult = true
	local nMapID = tCityIDToMapID[nX]
	local nTargetMapID = nY

	if IsPlayer(dwCharacterID) then
		--����貨΢���ɾ�
		if not player.IsAchievementAcquired(104) then
			player.AcquireAchievement(104)
		end

		if not tCityIDToMapID[nX] then
			bResult = false
		end
		if player.GetBuff(7732, 1) then
			player.SendSystemMessage(GetEditorString(6, 4483))
			return
		end

		--�ж�����Ƿ�ͨ��ͨ��
		local nNodeID = 0
		if not tMapIDToNodeID[nMapID] then
			bResult = false
		elseif 	tMapIDToNodeID[nMapID] then
			for k, v in pairs(tMapIDToNodeID[nMapID]) do
				if player.IsOpenRouteNode(v) then
					nNodeID = v
				end
			end
		end

		-- �汦֮�������
		if player.GetBuff(7049, 1) then
			player.DelBuff(7049, 1)
		end

		local tQuestMap = {
			[14765] = 225, --΢ɽ��Ժ
			[14766] = 224, --������
			[14767] = 228, --�����Ժ
			[14768] = 227, --��ɽʥȪ
			[14769] = 229, --����ˮ�
		}
		if player.GetBuff(3219, 10) then
		    for GreatWar_QuestID, _ in pairs(tQuestMap) do
		    	if player.GetQuestIndex(GreatWar_QuestID) then
		    		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "teach_base.finish_teach" )  --�ر�������ѧ
		    	end
	    	end
		end
		local dir, Type = GetMapParams(nTargetMapID)
		if nMapID == 74 then
			if player.dwTongID == 0 then
				player.SendSystemMessage(GetEditorString(3, 7703))
				RemoteCallToClient(player.dwID, "OnSendSystemAnnounce", GetEditorString(3, 7704), "red")
				player.ClearCDTime(244)
				return
			else
				RemoteCallToCenter("OnGetMasterAndMapRequest", player.dwID, player.nZ, "On_Tong_ShenXingChuanSong")
				return
			end
		elseif Type == 1 then
			player.AddBuff(0, 99, 6971, 1, 1)	--6971buffִ�д���
			local buff = player.GetBuff(6971, 1)
			buff.nCustomValue = nX
			player.AddBuff(0, 99, 772, 1, 2)
			player.AddBuff(0, 99, 3473, 2, 1)
			player.AddBuff(player.dwID, player.nLevel, 1061, 1)
			player.Jump(true, 0)
			player.AddBuff(player.dwID, player.nLevel, 1401, 1)
			player.AddBuff(0, 99, 7246, 1, 3)
			return
		elseif bResult == true and nNodeID ~= 0 then
			if player.nCamp ~= 1 and nMapID == 25 then	--�ж�������Һ͵ж���Ҵ��͵���Ӫ ���⴦��
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 726), 10)
				player.SendSystemMessage(GetEditorString(6, 726))
				player.ClearCDTime(244)
				return
			elseif player.nCamp ~= 2 and nMapID == 27 then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 727), 10)
				player.SendSystemMessage(GetEditorString(6, 727))
				player.ClearCDTime(244)
				return
			elseif player.nCamp == 1 and nX == 274 then	--�����������ȥ����ɽ���˹Ⱦݵ�
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 902), 10)
				player.SendSystemMessage(GetEditorString(6, 902))
				player.ClearCDTime(244)
				return
			elseif player.nCamp == 1 and nX == 276 then	--�����������ȥ���ض��˹Ⱦݵ�
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 903), 10)
				player.SendSystemMessage(GetEditorString(6, 903))
				player.ClearCDTime(244)
				return
			elseif player.nCamp == 2 and nX == 273 then	--���˹������ȥ����ɽ�����˾ݵ�
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 904), 10)
				player.SendSystemMessage(GetEditorString(6, 904))
				player.ClearCDTime(244)
				return
			elseif player.nCamp == 2 and nX == 275 then	--���˹������ȥ����ɽ�����˾ݵ�
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 905), 10)
				player.SendSystemMessage(GetEditorString(6, 905))
				player.ClearCDTime(244)
				return
			else
				player.AddBuff(0, 99, 11927, 1, 1)	--��¼����Ŀ���
				local buffLog = player.GetBuff(11927, 1)
				player.AddBuff(0, 99, 6971, 1, 1)		--6971buffִ�д���
				local buff = player.GetBuff(6971, 1)
				buff.nCustomValue = nX
				buffLog.nCustomValue = nMapID
				player.AddBuff(0, 99, 772, 1, 2)
				player.AddBuff(0, 99, 3473, 2, 1)
				player.AddBuff(player.dwID, player.nLevel, 1061, 1)
				player.Jump(true, 0)
				player.AddBuff(player.dwID, player.nLevel, 1401, 1)
				player.AddBuff(0, 99, 7246, 1, 3)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com