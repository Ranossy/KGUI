---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���Ǽ�_�Ӽ���_2��.lua
-- ����ʱ��:	2013/5/6 16:19:58
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2011-8-16
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 33*0.95, 	nDamageRand = 33*0.1,  nCostMana = 0}, --level 1
	{nDamageBase = 35*0.95, 	nDamageRand = 35*0.1,  nCostMana = 0}, --level 2
	{nDamageBase = 38*0.95, 	nDamageRand = 38*0.1,  nCostMana = 0}, --level 3
	{nDamageBase = 40*0.95, 	nDamageRand = 40*0.1,  nCostMana = 0}, --level 4
	{nDamageBase = 43*0.95, 	nDamageRand = 43*0.1,  nCostMana = 0}, --level 5
	{nDamageBase = 45*0.95, 	nDamageRand = 45*0.1,  nCostMana = 0}, --level 6
	{nDamageBase = 48*0.95, 	nDamageRand = 48*0.1,  nCostMana = 0}, --level 7
	{nDamageBase = 50*0.95, 	nDamageRand = 50*0.1,  nCostMana = 0}, --level 8
	{nDamageBase = 53*0.95, 	nDamageRand = 53*0.1,  nCostMana = 0}, --level 9
	{nDamageBase = 55*0.95, 	nDamageRand = 55*0.1,  nCostMana = 0}, --level 10
	{nDamageBase = 58*0.95, 	nDamageRand = 58*0.1,  nCostMana = 0}, --level 1
	{nDamageBase = 60*0.95, 	nDamageRand = 60*0.1,  nCostMana = 0}, --level 2
	{nDamageBase = 63*0.95, 	nDamageRand = 63*0.1,  nCostMana = 0}, --level 3
	{nDamageBase = 65*0.95, 	nDamageRand = 65*0.1,  nCostMana = 0}, --level 4
	{nDamageBase = 68*0.95, 	nDamageRand = 68*0.1,  nCostMana = 0}, --level 5
	{nDamageBase = 70*0.95, 	nDamageRand = 70*0.1,  nCostMana = 0}, --level 6
	{nDamageBase = 73*0.95, 	nDamageRand = 73*0.1,  nCostMana = 0}, --level 7
	{nDamageBase = 75*0.95, 	nDamageRand = 75*0.1,  nCostMana = 0}, --level 8
	{nDamageBase = 78*0.95, 	nDamageRand = 78*0.1,  nCostMana = 0}, --level 9
	{nDamageBase = 80*0.95, 	nDamageRand = 80*0.1,  nCostMana = 0}, --level 10
	{nDamageBase = 83*0.95, 	nDamageRand = 83*0.1,  nCostMana = 0}, --level 1
	{nDamageBase = 85*0.95, 	nDamageRand = 85*0.1,  nCostMana = 0}, --level 2
	{nDamageBase = 88*0.95, 	nDamageRand = 88*0.1,  nCostMana = 0}, --level 3
	{nDamageBase = 90*0.95, 	nDamageRand = 90*0.1,  nCostMana = 0}, --level 4
	{nDamageBase = 93*0.95, 	nDamageRand = 93*0.1,  nCostMana = 0}, --level 5
	{nDamageBase = 95*0.95, 	nDamageRand = 95*0.1,  nCostMana = 0}, --level 6
	{nDamageBase = 98*0.95, 	nDamageRand = 98*0.1,  nCostMana = 0}, --level 7
	{nDamageBase = 100*0.95, 	nDamageRand = 100*0.1,  nCostMana = 0}, --level 8
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_REPULSED,
		14, --����ʱ��(֡)
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(3200, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 3200, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 468);	--������ͨCD
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
	skill.nMinRadius = 10 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 50;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = 50 + (dwSkillLevel - 9) * 3
	else
		skill.nChannelInterval =120; 
	end
	
	--skill.nChannelInterval = 120; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 180;				-- �ӵ��ٶȣ���λ ��/֡
    
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
	skill.nWeaponDamagePercent = 1024;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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