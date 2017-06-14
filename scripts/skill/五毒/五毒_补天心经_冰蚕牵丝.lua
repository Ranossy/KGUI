---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_�����ľ�_����ǣ˿.lua
-- ����ʱ��:	2013/4/29 16:03:21
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
	{nAddRage = 0, nCostRage = 10, nDamageBase = 103*0.95, 	nDamageRand = 103*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 144*0.95, 	nDamageRand = 144*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 185*0.95, 	nDamageRand = 185*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 226*0.95, 	nDamageRand = 226*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 267*0.95, 	nDamageRand = 267*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 308*0.95, 	nDamageRand = 308*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 349*0.95, 	nDamageRand = 349*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 390*0.95, 	nDamageRand = 390*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 431*0.95, 	nDamageRand = 431*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 472*0.95, 	nDamageRand = 472*0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 513*0.95, 	nDamageRand = 513*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 554*0.95, 	nDamageRand = 554*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 595*0.95, 	nDamageRand = 595*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 636*0.95, 	nDamageRand = 636*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 677*0.95, 	nDamageRand = 677*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 718*0.95, 	nDamageRand = 718*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 759*0.95, 	nDamageRand = 759*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 800*0.95, 	nDamageRand = 800*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 841*0.95, 	nDamageRand = 841*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 882*0.95, 	nDamageRand = 882*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 923*0.95, 	nDamageRand = 923*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 964*0.95, 	nDamageRand = 964*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1005*0.95,	nDamageRand = 1005*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1046*0.95, nDamageRand = 1046*0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1087*0.95, nDamageRand = 1087*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1128*0.95, nDamageRand = 1128*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1169*0.95, nDamageRand = 1169*0.1, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1210*0.95, nDamageRand = 1210*0.1, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1251*0.95, nDamageRand = 1251*0.1, }, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1292*0.95, nDamageRand = 1292*0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1333*0.95, nDamageRand = 1333*0.1, }, -- Level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
   	
	skill.SetSubsectionSkill(1, 1, 2526, dwSkillLevel);   	-- 1����

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nDamageBase/8,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nDamageRand/8,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ��ɢ��˲��buff
		2844,
		1
		);
	--]]
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		2484,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�嶾/�嶾_�����ľ�_����ǣ˿.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2316, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	skill.SetCheckCoolDown(1, 444);
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
		skill.nCostManaBasePercent = 354*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 354 * 0.4;
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 354 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 354 * 0.8;
	else
		skill.nCostManaBasePercent = 354;
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	skill.nChainBranch = 2;					--��״���ܷ�֧��
	skill.nChainDepth = 1;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 28;				-- ����֡��
	skill.nChannelInterval = 45*1.15; 				-- ͨ�������ʱ�� 
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(1747)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	player.SetTimer(8, "scripts/skill/�嶾/�嶾_�����ľ�_����ǣ˿.lua", 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	player.DelBuff(2844,1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com