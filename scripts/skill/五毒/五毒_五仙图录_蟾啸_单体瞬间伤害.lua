---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_����ͼ¼_�Х.lua
-- ����ʱ��:	2013/5/7 14:14:18
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
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125*0.95, 	nDamageRand = 125*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 132*0.95, 	nDamageRand = 132*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 139*0.95, 	nDamageRand = 139*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 146*0.95, 	nDamageRand = 146*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 153*0.95, 	nDamageRand = 153*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160*0.95, 	nDamageRand = 160*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 167*0.95, 	nDamageRand = 167*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 174*0.95, 	nDamageRand = 174*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 181*0.95, 	nDamageRand = 181*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 188*0.95, 	nDamageRand = 188*0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 195*0.95, 	nDamageRand = 195*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 202*0.95, 	nDamageRand = 202*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 209*0.95, 	nDamageRand = 209*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 216*0.95, 	nDamageRand = 216*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 223*0.95, 	nDamageRand = 223*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 230*0.95, 	nDamageRand = 230*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 237*0.95, 	nDamageRand = 237*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 244*0.95, 	nDamageRand = 244*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 251*0.95, 	nDamageRand = 251*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 258*0.95, 	nDamageRand = 258*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 265*0.95, 	nDamageRand = 265*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 272*0.95, 	nDamageRand = 272*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 279*0.95, 	nDamageRand = 279*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 286*0.95, 	nDamageRand = 286*0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 293*0.95, 	nDamageRand = 293*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 300*0.95, 	nDamageRand = 300*0.1, }, -- Level 26
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
		0,
		0
	);	
	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2295, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 385);
	--skill.SetCheckCoolDown(1, 444);

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
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit = 8;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 32;				-- ����֡��
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 48*1.1;
 	elseif dwSkillLevel < 26 then
  		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 5)*1.1
  	else
  		skill.nChannelInterval =136*1.1;     -- ͨ�������ʱ��   
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