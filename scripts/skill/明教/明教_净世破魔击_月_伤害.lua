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
	{nLunarDamage = 85*2*0.98, 	nLunarDamageRand = 39*2*0.04,  nCostMana= 30 },--1
	{nLunarDamage = 90*2*0.98, 	nLunarDamageRand = 46*2*0.04,  nCostMana= 50 },--2
	{nLunarDamage = 95*2*0.98, 	nLunarDamageRand = 53*2*0.04,  nCostMana= 67 },--3
	{nLunarDamage = 100*2*0.98, 	nLunarDamageRand = 60*2*0.04,  nCostMana= 93 },--4
	{nLunarDamage = 105*2*0.98, 	nLunarDamageRand = 68*2*0.04,  nCostMana= 111},--5
	{nLunarDamage = 110*2*0.98, 	nLunarDamageRand = 75*2*0.04,  nCostMana= 130},--6
	{nLunarDamage = 115*2*0.98, 	nLunarDamageRand = 82*2*0.04,  nCostMana= 149},--7
	{nLunarDamage = 120*2*0.98, 	nLunarDamageRand = 89*2*0.04,  nCostMana= 167},--8
	{nLunarDamage = 125*2*0.98, 	nLunarDamageRand = 96*2*0.04,  nCostMana= 186},--9
	{nLunarDamage = 130*2*0.98, 	nLunarDamageRand = 104*2*0.04,  nCostMana= 186},--10 
	{nLunarDamage = 135*2*0.98, 	nLunarDamageRand = 111*2*0.04,  nCostMana= 30 },--1
	{nLunarDamage = 140*2*0.98, 	nLunarDamageRand = 118*2*0.04,  nCostMana= 50 },--2
	{nLunarDamage = 145*2*0.98, 	nLunarDamageRand = 125*2*0.04,  nCostMana= 67 },--3
	{nLunarDamage = 150*2*0.98, 	nLunarDamageRand = 132*2*0.04,  nCostMana= 93 },--4
	{nLunarDamage = 155*2*0.98, 	nLunarDamageRand = 140*2*0.04,  nCostMana= 111},--5
	{nLunarDamage = 160*2*0.98, 	nLunarDamageRand = 147*2*0.04,  nCostMana= 130},--6
	{nLunarDamage = 165*2*0.98, 	nLunarDamageRand = 154*2*0.04,  nCostMana= 149},--7
	{nLunarDamage = 170*2*0.98, 	nLunarDamageRand = 161*2*0.04,  nCostMana= 167},--8
	{nLunarDamage = 175*2*0.98, 	nLunarDamageRand = 168*2*0.04,  nCostMana= 186},--9
	{nLunarDamage = 180*2*0.98, 	nLunarDamageRand = 176*2*0.04,  nCostMana= 186},--10
	{nLunarDamage = 185*2*0.98, 	nLunarDamageRand = 183*2*0.04,  nCostMana= 30 },--1
	{nLunarDamage = 190*2*0.98, 	nLunarDamageRand = 190*2*0.04,  nCostMana= 50 },--2
	{nLunarDamage = 197*2*0.98, 	nLunarDamageRand = 197*2*0.04,  nCostMana= 67 },--3
	{nLunarDamage = 204*2*0.98, 	nLunarDamageRand = 204*2*0.04,  nCostMana= 93 },--4
	{nLunarDamage = 212*2*0.98, 	nLunarDamageRand = 212*2*0.04,  nCostMana= 111},--5
	{nLunarDamage = 219*2*0.98, 	nLunarDamageRand = 219*2*0.04,  nCostMana= 130},--6
	{nLunarDamage = 226*2*0.98, 	nLunarDamageRand = 226*2*0.04,  nCostMana= 149},--7
	{nLunarDamage = 233*2*0.98, 	nLunarDamageRand = 233*2*0.04,  nCostMana= 167},--8
	{nLunarDamage = 240*2*0.98, 	nLunarDamageRand = 240*2*0.04,  nCostMana= 186},--9
	{nLunarDamage = 248*2*0.98, 	nLunarDamageRand = 248*2*0.04,  nCostMana= 186},--10
	{nLunarDamage = 255*2*0.98, 	nLunarDamageRand = 255*2*0.04,  nCostMana= 30 },--1
	{nLunarDamage = 262*2*0.98, 	nLunarDamageRand = 262*2*0.04,  nCostMana= 50 },--2
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage/7,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand/7,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0, 
		0
	);
	
--���������˺� 
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
		-1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
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
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 9 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 26*1.15;
	elseif dwSkillLevel < 32 then
		skill.nChannelInterval =(26 + (dwSkillLevel - 9) * 1)*1.15
	else
		skill.nChannelInterval =60*1.15;     -- ͨ�������ʱ��   
	end
	
	--skill.nChannelInterval	= 60; 				-- ͨ�������ʱ�� 
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
	skill.nWeaponDamagePercent		= 1024;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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
	local playerA = GetPlayer(dwCharacterID)
	if not playerA then
		return
	end
	local level = playerA.GetSkillLevel(3967)
	playerA.CastSkill(4476,level)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com