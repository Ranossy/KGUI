---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����ڳ�_��ɱ.lua
-- ����ʱ��:	2013/8/19 20:41:10
-- �����û�:	zhouyixiao1
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0},		--level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/�����ڳ�_��ɱ.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	skill.AddSlowCheckDestBuff(6494, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	
	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�
	
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 631);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;
	
	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	
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
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 2 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
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
	skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	local nTargetType, dwTargetID = player.GetTarget()
	local npc = GetNpc(dwTargetID)
	if nTargetType == TARGET.NPC then
		local scene = player.GetScene()
		local nQuestID = 11537
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		local nQuestPhase = player.GetQuestPhase(nQuestID)
		local nQuestID1 = 11800
		local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
		local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
		if not scene then
			return false, false
		end
		if not player.GetBuff(6505, 1) then --����BUFF
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 8353), 4)
			return false, false
		end
		if not npc.GetBuff(6494, 1) then
			if not npc.GetBuff(6503, 1) then
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 8348), 4)
				return false, false
			end
		end
		if npc.GetBuff(6503, 1) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 8349), 4)
			return false, false
		end
		if player.GetBuff(6499, 1) then
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 8350), 4)
			return false, false
		end
		local nRad = 2 * math.pi * (npc.nFaceDirection * 360 / 255 - 20) / 360
		if (nQuestIndex and nQuestPhase == 1) or  (nQuestIndex1 and nQuestPhase1 == 1) then
			player.Stop()
			player.AddBuff(0, 99, 6504, 1, 2)
			npc.DelBuff(6494, 1)
			npc.AddBuff(0, 99, 6503, 1, 5)
			player.SetPosition(npc.nX - 0.8 * 64 * math.cos(nRad),npc.nY - 0.8 * 64 * math.sin(nRad),npc.nZ)
			player.TurnTo(npc.nFaceDirection)	
			npc.FireAIEvent(2001, 0, 0)
			player.DoAction(player.dwID, 10054)
			RemoteCallToClient(player.dwID, "EnableColorShift", true)
			RemoteCallToClient(player.dwID, "SetColorShift", 3)
			RemoteCallToClient(player.dwID, "SetMaxCameraDistance", 300)
			if npc.dwTemplateID == 26752 then
				player.SetTimer(32, "scripts/skill/Quest/�����ڳ�_��ɱ.lua", 0, 26752)
			else
				player.SetTimer(32, "scripts/skill/Quest/�����ڳ�_��ɱ.lua", 0, 0)
			end
			
		else
			RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(5, 8354), 4)
		end
		return false, false
	end
	return nPreResult;
end
function OnTimer(player, nParam1, nParam2)
	if nParam2 == 26752 then
		local tPartyMember = player.GetPartyMemberList()
		if not tPartyMember then
			local nQuestID = 11537
			local nQuestIndex = player.GetQuestIndex(nQuestID)
			local nQuestPhase = player.GetQuestPhase(nQuestID)
			local nQuestID1 = 11800
			local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
			local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
			if nQuestIndex and nQuestPhase == 1 then
				local value = player.GetQuestValue(nQuestIndex, 2)
				player.SetQuestValue(nQuestIndex, 2, value + 1)
				RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
			end
			if nQuestIndex1 and nQuestPhase1 == 1 then
				local value = player.GetQuestValue(nQuestIndex1, 2)
				player.SetQuestValue(nQuestIndex1, 2, value + 1)
				RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
			end
			RemoteCallToClient(player.dwID, "EnableColorShift", false)
		else
			local nPartyMemberCount = #tPartyMember
			local nShareDistance = 4096
			local nQuestID = 11537
			local nQuestIndex = player.GetQuestIndex(nQuestID)
			local nQuestPhase = player.GetQuestPhase(nQuestID)
			local nQuestID1 = 11800
			local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
			local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
			for i = 1, nPartyMemberCount do
				local member = GetPlayer(tPartyMember[i])
				if member then
					local memberScene = member.GetScene()
					nQuestPhase = member.GetQuestPhase(nQuestID)
					nQuestPhase1 = member.GetQuestPhase(nQuestID1)
					if nQuestPhase == 1 then
						local nDistance = GetCharacterDistance(player.dwID, member.dwID)
						if nDistance <= nShareDistance then
							local nQuestIndex = member.GetQuestIndex(nQuestID)
							if nQuestIndex then
								local nValue = member.GetQuestValue(nQuestIndex, 2)
								member.SetQuestValue(nQuestIndex, 2, nValue + 1)
								RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
							end
							RemoteCallToClient(player.dwID, "EnableColorShift", false)
						end
					end
					if nQuestPhase1 == 1 then
						local nDistance = GetCharacterDistance(player.dwID, member.dwID)
						if nDistance <= nShareDistance then
							local nQuestIndex1 = member.GetQuestIndex(nQuestID1)
							if nQuestIndex1 then
								local nValue = member.GetQuestValue(nQuestIndex1, 2)
								member.SetQuestValue(nQuestIndex1, 2, nValue + 1)
								RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
							end
							RemoteCallToClient(player.dwID, "EnableColorShift", false)
						end
					end
				end
			end
		end	
	else
		local nQuestID = 11537
		local nQuestIndex = player.GetQuestIndex(nQuestID)
		local nQuestPhase = player.GetQuestPhase(nQuestID)
		local nQuestID1 = 11800
		local nQuestIndex1 = player.GetQuestIndex(nQuestID1)
		local nQuestPhase1 = player.GetQuestPhase(nQuestID1)
		if nQuestIndex and nQuestPhase == 1 then
			local value = player.GetQuestValue(nQuestIndex, 1)
			player.SetQuestValue(nQuestIndex, 1, value + 1)
			if not player.GetBuff(6830, 1) then
				player.AddBuff(0, 99, 6830, 1, 1)	
			end
			if player.GetBuff(6830, 1) then
				local buffcj = player.GetBuff(6830, 1)
				if buffcj then
					buffcj.nCustomValue = buffcj.nCustomValue + 1
					local jishu = buffcj.nCustomValue
					if jishu >= 3 then
						if player.GetAchievementCount(3867) < 1 then 
							player.AddAchievementCount(3867, 1) --��������
						end 		
					end
				end		
			end
			RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
			local value1 = player.GetQuestValue(nQuestIndex, 1)
			local value2 = player.GetQuestValue(nQuestIndex, 2)
			if value1 >= 4 and value2 == 1 then
				if not player.GetBuff(6499, 1) then
					player.CastSkill(7990, 1)
				end
			end
		end
		if nQuestIndex1 and nQuestPhase1 == 1 then
			local value = player.GetQuestValue(nQuestIndex1, 1)
			player.SetQuestValue(nQuestIndex1, 1, value + 1)
			if not player.GetBuff(6830, 1) then
				player.AddBuff(0, 99, 6830, 1, 1)	
			end
			if player.GetBuff(6830, 1) then
				local buffcj = player.GetBuff(6830, 1)
				if buffcj then
					buffcj.nCustomValue = buffcj.nCustomValue + 1
					local jishu = buffcj.nCustomValue
					if jishu >= 3 then
						if player.GetAchievementCount(3867) < 1 then 
							player.AddAchievementCount(3867, 1) --��������
						end 		
					end
				end		
			end
			RemoteCallToClient(player.dwID, "RestoreMaxCameraDistance")
			local value1 = player.GetQuestValue(nQuestIndex1, 1)
			local value2 = player.GetQuestValue(nQuestIndex1, 2)
			if value1 >= 4 and value2 == 1 then
				if not player.GetBuff(6499, 1) then
					player.CastSkill(7990, 1)
				end
			end
		end
		RemoteCallToClient(player.dwID, "EnableColorShift", false)
	end
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com