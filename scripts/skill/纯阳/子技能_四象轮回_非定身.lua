---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�Ӽ���_�����ֻ�_�Ƕ���.lua
-- ����ʱ��:	2013/6/22 16:37:36
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2009-03-12
-- Ч����ע	:  �����ֻ��Ӽ���_��Ŀ��Ƕ���ʱʩ�ųɹ�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 29, nDamageRand = 5}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 40, nDamageRand = 5}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 50, nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 60, nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 69, nDamageRand = 5}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 76, nDamageRand = 5}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 81, nDamageRand = 5}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 83, nDamageRand = 5}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 85, nDamageRand = 5}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 87, nDamageRand = 5}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 90, nDamageRand = 5}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 95, nDamageRand = 5}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 100, nDamageRand = 5}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 105, nDamageRand = 10}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 110, nDamageRand = 10}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 115, nDamageRand = 10}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 120, nDamageRand = 10}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 125, nDamageRand = 10}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 130, nDamageRand = 10}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 135, nDamageRand = 15}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 140, nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 144, nDamageRand = 15}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 148, nDamageRand = 15}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 152, nDamageRand = 15}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 156, nDamageRand = 15}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 160, nDamageRand = 20}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 162, nDamageRand = 20}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 164, nDamageRand = 20}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 166, nDamageRand = 20}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 168, nDamageRand = 20}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 172, nDamageRand = 20}, -- Level 31 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 176, nDamageRand = 20}, -- Level 32
	{nAddRage = 0, nCostRage = 0, nDamageBase = 180, nDamageRand = 20}, -- Level 33
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ��Ԫ�˺�
		tSkillData[dwSkillLevel].nDamageBase, -- ����ֵ1
		0																-- ����ֵ2
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- ��Ԫ�˺�����ֵ
		tSkillData[dwSkillLevel].nDamageRand, -- ����ֵ1
		0																-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- Call��Ԫ�˺�
		0, -- ����ֵ1
		0																-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.ACCUMULATE, -- ����
		2, -- 1��
		0																-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/�Ӽ���_�����ֻ�_�Ƕ���.lua", -- ��Э��
		0
		);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2086, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 555, 1);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 431);	

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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	if dwSkillLevel < 8 then
		skill.nChannelInterval = 32*1.1*1.1*0.95;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = (32 + (dwSkillLevel - 7) * 5)*1.1*1.1*0.95
	else
		skill.nChannelInterval = 170*1.1*1.1*0.95;     -- ͨ�������ʱ��   
	end
	

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
	
	--Skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	if player.GetBuff(10078, 1) then
		player.DelBuff(10078, 1)
	end
	
	--����������
	local i = Random(1, 100)
	if i <= 25 then 
		if player.GetSkillLevel(5824) == 1 then
			player.CastSkill(6090, 1)
		end
	end

	
	if player.nAccumulateValue >= 10 then
		player.AddBuff(dwCharacterID, player.nLevel, 6422, 1, 1)
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	--local target = player.GetSelectCharacter()
	if not target then
		return
	end
	--if player.GetSkillLevel(5840) == 1 then
	if player.IsSkillRecipeActive(90, 1) then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6374, 1, 1)
	end
	if player.GetSkillLevel(5840) == 1 then
		if player.IsSkillRecipeActive(90, 1) then
			target.AddBuff(dwSkillSrcID, player.nLevel, 555, 3, 1)
		else
			target.AddBuff(dwSkillSrcID, player.nLevel, 555, 2, 1)
		end
	end
	if player.GetSkillLevel(6797) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6351, 1, 1)
	end
	local f = Random(1, 100)
	if f <= 20 then
		if player.GetSkillLevel(6910) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6425, 1, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com