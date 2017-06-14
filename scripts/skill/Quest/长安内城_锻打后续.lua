---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����ڳ�_�ʹ����.lua
-- ����ʱ��:	2013/8/2 15:54:28
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
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/�����ڳ�_�ʹ����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
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
	--skill.SetPublicCoolDown(590);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 628);	--������ͨCD
	--skill.SetCheckCoolDown(1, 444)	
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	-- ����CD
	--skill.SetPublicCoolDown(590);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 607);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
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
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames  	= 20;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval = 17; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval = 1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame = 153;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame = 1;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
	--skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	--skill.nWeaponDamagePercent = 0; -- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	--skill.nWeaponDamagePercent = 0; -- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local scene = player.GetScene()
	local nQuestID = 11535
	local nQuestID1 = 11798
	local tList = player.GetPartyMemberList()
	local tjueseList = 0
	local nQuestIndex = player.GetQuestIndex(11535)
	local nQuestIndex1 = player.GetQuestIndex(11798)
	if nQuestIndex then
		player.SetQuestValue(nQuestIndex, 6, 0)
	end
	if nQuestIndex1 then
		player.SetQuestValue(nQuestIndex1, 6, 0)
	end
	local tZuoBiao = {
		[172] = {106375, 46558, 1051776}, 
	}
	if tList then --�ж϶����ڵ����
		tjueseList = {
			tList[1],
			tList[2],
			tList[3],
			tList[4],
			tList[5],
		}
	end
	for i = 1, #tjueseList do
		local jueseID = tjueseList[i]
		if jueseID then
			local Member = GetPlayer(jueseID)
			if Member then --���������ڵ����г�Ա���ھ��뷶Χ�ڲŷŽ�
				if not Member.GetBuff(6831, 1) then
					local buff3 = Member.GetBuff(6789, 1)
					local jieshu = 0
					if buff3 then
						buff3.nCustomValue = buff3.nCustomValue + 1
						jieshu = buff3.nCustomValue
					end
					local buff = Member.GetBuff(6477, 1)
					if buff then
						local shuzhi = buff.nCustomValue - 1
						local szNPCjian = scene.GetNpcByNickName(Member.dwID .. "jianshen" .. shuzhi)
						if szNPCjian then
							szNPCjian.SetDisappearFrames(1)
						end
					end		
					if Member.GetBuff(6477, 1) then			
						if Member.GetBuff(6475, 1) then
							Member.AddBuff(0, 99, 6475, 1, 1) --ʱ��ˢ��
							local nQuestID = 11535
							local nQuestPhase = Member.GetQuestPhase(nQuestID)
							local nQuestIndex = Member.GetQuestIndex(nQuestID)
							local nQuestID1 = 11798
							local nQuestPhase1 = Member.GetQuestPhase(nQuestID1)
							local nQuestIndex1 = Member.GetQuestIndex(nQuestID1)
							local value = 0
							local valueJs = 0
							if nQuestIndex then
								value = Member.GetQuestValue(nQuestIndex, 0)
								valueJs = Member.GetQuestValue(nQuestIndex, 0) --����ʱ���������
								Member.SetQuestValue(nQuestIndex, 0, value + 1)
							end
							if nQuestIndex1 then
								value = Member.GetQuestValue(nQuestIndex1, 0)
								valueJs = Member.GetQuestValue(nQuestIndex1, 0) --����ʱ���������
								Member.SetQuestValue(nQuestIndex1, 0, value + 1)
							end
							if valueJs >= 10 or jieshu >= 10 then
								RemoteCallToClient(Member.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(5, 8111), 8)
								if nQuestIndex then
									Member.SetQuestValue(nQuestIndex,0,10)
								end
								if nQuestIndex1 then
									Member.SetQuestValue(nQuestIndex1,0,10)
								end
								Member.SetDynamicSkillGroup(0) --�л���̬������
								Member.DelBuff(6475, 1)
								if Member.GetBuff(6825, 1) then
									if Member.GetAchievementCount(3864) < 1 then 
										Member.AddAchievementCount(3864, 1) --һ���Զʹ�ɹ�
									end 	
								end
								local jian = Member.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 20562)
								local jian2 = Member.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 20436)
								if jian < 1 then
									if jian2 == 1 then
										Member.CostItem(ITEM_TABLE_TYPE.OTHER, 20436, 1)
										Member.AddItem(ITEM_TABLE_TYPE.OTHER, 20562, 1)
									end
								end
								local buff = Member.GetBuff(6477, 1)
								if buff then
									local shuzhi = buff.nCustomValue - 1
									local shuzhi1 = buff.nCustomValue
									local szNPCjian = scene.GetNpcByNickName(Member.dwID .. "jianshen" .. shuzhi)
									local szNPCjian1 = scene.GetNpcByNickName(Member.dwID .. "jianshen" .. shuzhi1)
									if szNPCjian then
										szNPCjian.SetDisappearFrames(1)
									end
									if szNPCjian1 then
										szNPCjian1.SetDisappearFrames(1)
									end
								end
								local buff2 = Member.GetBuff(6679, 1)
								if buff2 then
									local shuzhi2 = buff2.nCustomValue - 1
									local shuzhi22 = buff2.nCustomValue
									local szNPCjian2 = scene.GetNpcByNickName(Member.dwID .. "jianshen2" .. shuzhi2)
									local szNPCjian22 = scene.GetNpcByNickName(Member.dwID .. "jianshen2" .. shuzhi22)
									if szNPCjian2 then
										szNPCjian2.SetDisappearFrames(1)
									end
									if szNPCjian22 then
										szNPCjian22.SetDisappearFrames(1)
									end
								end
								Member.SetDynamicSkillGroup(0) --�л���̬������
							end		
						end
						local buff = Member.GetBuff(6477, 1)
						if buff then
							local shuzhi = buff.nCustomValue - 1
							local shuzhi2 = buff.nCustomValue - 2
							local szNPCjian = scene.GetNpcByNickName(Member.dwID .. "jianshen" .. shuzhi)
							local szNPCjian2 = scene.GetNpcByNickName(Member.dwID .. "jianshen" .. shuzhi2)
							if szNPCjian then
								szNPCjian.SetDisappearFrames(1)
							end
							if szNPCjian2 then
								szNPCjian2.SetDisappearFrames(1)
							end
						end
						if Member.GetBuff(6679, 1) then
							Member.DelBuff(6477, 1)
						end
					else
						local nQuestID = 11535
						local nQuestPhase = Member.GetQuestPhase(nQuestID)
						local nQuestIndex = Member.GetQuestIndex(nQuestID)
						local nQuestID1 = 11798
						local nQuestPhase1 = Member.GetQuestPhase(nQuestID1)
						local nQuestIndex1 = Member.GetQuestIndex(nQuestID1)
						if nQuestIndex and nQuestPhase == 1 then
							Member.SetQuestValue(nQuestIndex, 0, 0)
							Member.SetQuestValue(nQuestIndex, 7, 0)
							Member.SetQuestValue(nQuestIndex, 6, 0)
							Member.SetQuestValue(nQuestIndex, 5, 0)
						end
						if nQuestIndex1 and nQuestPhase1 == 1 then
							Member.SetQuestValue(nQuestIndex1, 0, 0)
							Member.SetQuestValue(nQuestIndex1, 7, 0)
							Member.SetQuestValue(nQuestIndex1, 6, 0)
							Member.SetQuestValue(nQuestIndex1, 5, 0)
						end
						Member.SetDynamicSkillGroup(0)
						RemoteCallToClient(Member.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(5, 9145), 4)
						if Member.GetBuff(6825, 1) then
							Member.DelBuff(6825, 1)
						end
						if Member.GetBuff(6477, 1) then
							Member.DelBuff(6477, 1)
						end
						if Member.GetBuff(6879, 1) then
							Member.DelBuff(6879, 1)
						end
					end				
				end		
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com