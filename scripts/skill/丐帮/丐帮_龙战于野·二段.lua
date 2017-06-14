---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/ؤ��_��ս��Ұ������.lua
-- ����ʱ��:	2014/1/15 16:01:48
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  CBG
-- ����ʱ��	:  2013-03-12
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/ؤ��/ؤ��_��ս��Ұ������.lua",
		0														
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		38,
		0														
	);   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		37,
		1						--1���Լ���0��Ŀ��								
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6853,
		dwSkillLevel			--��ͨDot
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6867,
		dwSkillLevel			--����Dot
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		6399,
		1
	);	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(5988, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	--skill.SetDelaySubSkill(1, 6369, dwSkillLevel)
	--skill.SetDelaySubSkill(1, 8476, dwSkillLevel)--��Ѩ����
	--skill.SetDelaySubSkill(2, 6370, dwSkillLevel)
	--skill.SetDelaySubSkill(2, 8477, dwSkillLevel)--��Ѩ����
	--skill.SetDelaySubSkill(3, 6371, dwSkillLevel)
	--skill.SetDelaySubSkill(3, 8478, dwSkillLevel)--��Ѩ����
	--skill.SetDelaySubSkill(4, 6372, dwSkillLevel)
	--skill.SetDelaySubSkill(4, 8479, dwSkillLevel)--��Ѩ����
	--skill.SetDelaySubSkill(6, 6373, dwSkillLevel)
	--skill.SetDelaySubSkill(6, 8480, dwSkillLevel)--��Ѩ����
	--skill.SetDelaySubSkill(19, 6374, 1)		--���һ��
	--skill.SetDelaySubSkill(19, 8481, 1)--��Ѩ����
	--skill.SetDelaySubSkill(19, 6374, 2)		--���һ��
	--skill.SetDelaySubSkill(19, 8481, 2)--��Ѩ����
	--skill.SetDelaySubSkill(20, 6374, 3)		--���һ��
	--skill.SetDelaySubSkill(20, 8481, 3)--��Ѩ����
	--skill.SetDelaySubSkill(20, 6374, 4)		--���һ��
	--skill.SetDelaySubSkill(20, 8481, 4)--��Ѩ����
	--skill.SetDelaySubSkill(21, 6374, 5)		--���һ��
	--skill.SetDelaySubSkill(21, 8481, 5)--��Ѩ����
	--skill.SetDelaySubSkill(21, 6374, 6)		--���һ��
	--skill.SetDelaySubSkill(21, 8481, 6)--��Ѩ����
	--skill.SetDelaySubSkill(22, 6374, 7)		--���һ��
	--skill.SetDelaySubSkill(22, 8481, 7)--��Ѩ����
	--skill.SetDelaySubSkill(22, 6374, 8)		--���һ��
	--skill.SetDelaySubSkill(22, 8481, 8)--��Ѩ����
	--skill.SetDelaySubSkill(23, 6374, 9)		--���һ��
	--skill.SetDelaySubSkill(23, 8481, 9)--��Ѩ����
	--skill.SetDelaySubSkill(23, 6374, 10)		--���һ��
	--skill.SetDelaySubSkill(23, 8481, 10)--��Ѩ����
	--skill.SetDelaySubSkill(24, 6374, 11)		--���һ��
	--skill.SetDelaySubSkill(24, 8481, 11)--��Ѩ����
	--skill.SetDelaySubSkill(24, 6374, 12)		--���һ��
	--skill.SetDelaySubSkill(24, 8481, 12)--��Ѩ����
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
	--skill.BindBuff(1, 6367, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(590);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	skill.SetCheckCoolDown(1, 16);	--ֻ��鲻�ߵ�CD
	skill.SetCheckCoolDown(2, 444)	
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	skill.nCostManaMaxPercent = 0.5 * 1024;					-- �������ĵ�����
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 3 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
   
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
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
	
	skill.nWeaponDamagePercent = 0; -- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if not player then 
		return SKILL_RESULT_CODE.FAILED
	end
	local target = player.GetSelectCharacter()
	if not target then 
		return SKILL_RESULT_CODE.FAILED
	end
	if nPreResult == 1 then
		player.TurnToCharacter(target.dwID)
		if target.nImmuneSkillMoveCount == 0 then
			target.TurnToCharacter(player.dwID)
			--player.AdjustPlayerDistance(target.dwID,128)
		end
		if player.GetSkillLevel(6814) == 1 and player.nCurrentMana / player.nMaxMana < 0.5 and player.GetBuff(6450, 1) == nil then
			player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
		end
		if player.GetSkillLevel(6843) == 1 and player.GetBuff(6450, 1) == nil then
			if player.nCurrentMana >= 0.7 * player.nMaxMana then
				player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			end
			if player.nCurrentMana >= 0.6 * player.nMaxMana then
				player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			end
			if player.nCurrentMana >= 0.5 * player.nMaxMana then
				player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			end
		end
		player.AddBuff(player.dwID, player.nLevel, 6450, 1, 1)
		--player.AddBuff(player.dwID, player.nLevel, 5754, 1, 33)
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3444)
	end
	--��������ָ������
	local nQuestIndex = player.GetQuestIndex(13258)
	local nQuestPhase = player.GetQuestPhase(13258)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local target = player.GetSelectCharacter()
	if not target then 
		return
	end
	local lv = player.GetSkillLevel(5638)
	if target.nCurrentLife <= target.nMaxLife * 0.3 and player.GetSkillLevel(6839) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 7157, 1, 1)
	end
	player.CastSkill(8542, lv)
	player.AddBuff(player.dwID, player.nLevel, 5754, 1, 33)
	if target.nImmuneSkillMoveCount == 0 then
		target.BeHitted(player.dwID, 5638, 1, 48)
	end
	player.nCurrentMana = 0
	local i = Random(1, 1000)
	if player.GetSkillLevel(6823) == 1 and player.GetBuff(6399, 1) == nil then
		if i <= 500 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.3
		end
	end
	if player.GetBuff(5988, 1) ~= nil then
		if player.GetSkillLevel(14633) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6385, 2, 1)
		else
			player.AddBuff(dwCharacterID, player.nLevel, 6385, 1, 1)	
		end
		player.DelBuff(5988, 1)
	end
	--player.AdddBuff(dwCharacterID,player.nLevel,6470,1,1)--����
	--��ħ�����漴����
	if player.GetSkillLevel(9293) == 1 then
		local nRnd = Random(1, 10000)
		if nRnd <= 2000 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.1
		elseif nRnd <= 7000 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.2
		elseif nRnd <= 7500 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.3
		elseif nRnd <= 8500 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.4
		else
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.5
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com