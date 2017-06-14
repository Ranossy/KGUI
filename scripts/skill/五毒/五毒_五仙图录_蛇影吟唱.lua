---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_����ͼ¼_��Ӱ.lua
-- ����ʱ��:	2013/5/7 14:19:29
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  CBG
-- ����ʱ��	:  2010-11-19
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 111/3*0.95, 	nDamageRand = 111/3*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 126/3*0.95, 	nDamageRand = 126/3*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 141/3*0.95, 	nDamageRand = 141/3*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 156/3*0.95, 	nDamageRand = 156/3*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 171/3*0.95, 	nDamageRand = 171/3*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 186/3*0.95, 	nDamageRand = 186/3*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 201/3*0.95, 	nDamageRand = 201/3*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 216/3*0.95, 	nDamageRand = 216/3*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 231/3*0.95, 	nDamageRand = 231/3*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 246/3*0.95, 	nDamageRand = 246/3*0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 261/3*0.95, 	nDamageRand = 261/3*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 276/3*0.95, 	nDamageRand = 276/3*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 291/3*0.95, 	nDamageRand = 291/3*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 306/3*0.95, 	nDamageRand = 306/3*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 321/3*0.95, 	nDamageRand = 321/3*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 336/3*0.95, 	nDamageRand = 336/3*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 351/3*0.95, 	nDamageRand = 351/3*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 366/3*0.95, 	nDamageRand = 366/3*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 381/3*0.95, 	nDamageRand = 381/3*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 396/3*0.95, 	nDamageRand = 396/3*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 411/3*0.95, 	nDamageRand = 411/3*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 426/3*0.95, 	nDamageRand = 426/3*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 441/3*0.95, 	nDamageRand = 441/3*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 456/3*0.95, 	nDamageRand = 456/3*0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 471/3*0.95, 	nDamageRand = 471/3*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 486/3*0.95, 	nDamageRand = 486/3*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 501/3*0.95, 	nDamageRand = 501/3*0.1, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 516/3*0.95, 	nDamageRand = 516/3*0.1, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 531/3*0.95, 	nDamageRand = 531/3*0.1, }, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 546/3*0.95, 	nDamageRand = 546/3*0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 561/3*0.95, 	nDamageRand = 561/3*0.1, }, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 576/3*0.95, 	nDamageRand = 576/3*0.1, }, -- Level 32
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
--���Ӷ����ڹ�AP�ӳ�2��
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
	--ATTRIBUTE_TYPE.POISON_ATTACK_POWER_PERCENT,								-- ħ������
	--14280,							-- ����ֵ1
	--0																-- ����ֵ2
	--);
	skill.AddAttribute(													-- �����ƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		6237, --����ֵ1
		dwSkillLevel										--����ֵ2
		);
	skill.AddAttribute(													-- dot����
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�嶾/�嶾_����ͼ¼_��Ӱ.lua", --����ֵ1
		0										--����ֵ2
	);
	--[[
	skill.AddAttribute(													-- �����ƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2457, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- ���Ĺƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2462, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- �ݲйƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2467, --����ֵ1
		dwSkillLevel										--����ֵ2
		);
	--]]
 		
	skill.AddAttribute(													-- ���䣬֣���� 20110613
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		3067, --����ֵ1
		1										--����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_GROUP_BUFF_BY_ID_AND_LEVEL,
		6226,
		1
	);	
	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2296, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

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
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 386*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 386 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 386 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 386 * 0.8;
	else
		skill.nCostManaBasePercent = 386;
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 4 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 24;				-- ����֡��
	skill.nMinPrepareFrames  	= 1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
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
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com