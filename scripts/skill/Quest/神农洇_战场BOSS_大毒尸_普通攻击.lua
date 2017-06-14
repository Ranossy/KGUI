------------------------------------------------
-- �ļ���    :  ��ũ�_ս��BOSS_��ʬ_��ͨ����.lua
-- ������    : CBG
-- ����ʱ��  :  2009-6-18
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  �Ե���Ŀ�����3240���⹦�˺������40%Ѫ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 198 *0.8, nDamageRand = 198 *0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 1		0-4
	{nDamageBase = 335 *0.8, nDamageRand = 335 *0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 2},		--level 2		5-9
	{nDamageBase = 480 *0.8, nDamageRand = 480 *0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 3},		--level 3		10-14
	{nDamageBase = 699 *0.8, nDamageRand = 699 *0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 4		15-19
	{nDamageBase = 917 *0.8, nDamageRand = 917 *0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 5		20-24
	{nDamageBase = 1262*0.8, nDamageRand = 1262*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 6		25-29
	{nDamageBase = 1505*0.8, nDamageRand = 1505*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 7		30-34
	{nDamageBase = 1747*0.8, nDamageRand = 1747*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 8		35-39
	{nDamageBase = 1990*0.8, nDamageRand = 1990*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 9		40-44
	{nDamageBase = 2233*0.8, nDamageRand = 2233*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 10		45-49
	{nDamageBase = 2476*0.8, nDamageRand = 2476*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 11		50-54
	{nDamageBase = 2718*0.8, nDamageRand = 2718*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 12		55-59
	{nDamageBase = 2961*0.8, nDamageRand = 2961*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 13		60-64
	{nDamageBase = 3204*0.8, nDamageRand = 3204*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 14		65-69
	{nDamageBase = 3447*0.8, nDamageRand = 3447*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 15		70-74
	{nDamageBase = 3689*0.8, nDamageRand = 3689*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 16		75-79
	{nDamageBase = 3932*0.8, nDamageRand = 3932*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 17		80-84
	{nDamageBase = 4175*0.8, nDamageRand = 4175*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 18		85-89
	{nDamageBase = 4418*0.8, nDamageRand = 4418*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 19		90-94
	{nDamageBase = 4660*0.8, nDamageRand = 4660*0.4, nCostMana = 38,	nBuffID = 844,	nBuffLevel = 1},		--level 20		95-99	
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
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
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetCoolDown(1, 16);						-- ����CD 1.5��
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

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
	skill.nMaxRadius		= 8 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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
    --skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
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