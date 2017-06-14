------------------------------------------------
-- �ļ���    :  Τ�����ƶ�1.lua
-- ������    :  �º���	
-- ����ʱ��  :  2008-07-18
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �޺�����
-- ��������  :  Τ������
-- ����Ч��  :  ���ݾ�����Ŀ������⹦�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 346/3*0.95, 	nDamageRand = 346/3*0.1}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 370/3*0.95, 	nDamageRand = 370/3*0.1}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 394/3*0.95, 	nDamageRand = 394/3*0.1}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 418/3*0.95, 	nDamageRand = 418/3*0.1}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 442/3*0.95, 	nDamageRand = 442/3*0.1}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 466/3*0.95, 	nDamageRand = 466/3*0.1}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 490/3*0.95, 	nDamageRand = 490/3*0.1}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 514/3*0.95, 	nDamageRand = 514/3*0.1}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 538/3*0.95, 	nDamageRand = 538/3*0.1}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 562/3*0.95, 	nDamageRand = 562/3*0.1}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 586/3*0.95, 	nDamageRand = 586/3*0.1}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 610/3*0.95, 	nDamageRand = 610/3*0.1}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 634/3*0.95, 	nDamageRand = 634/3*0.1}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 658/3*0.95, 	nDamageRand = 658/3*0.1}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 682/3*0.95, 	nDamageRand = 682/3*0.1}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 706/3*0.95, 	nDamageRand = 706/3*0.1}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 730/3*0.95, 	nDamageRand = 730/3*0.1}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 754/3*0.95, 	nDamageRand = 754/3*0.1}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 778/3*0.95, 	nDamageRand = 778/3*0.1}, -- Level 19
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	--����һ����Ѫ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CAST_SKILL,
		13681, 
		dwSkillLevel
		);
	--����һ����Ѫ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CAST_SKILL,
		13682, 
		dwSkillLevel
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0, 
		0
	);
    --]]	
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1, 1928, 1);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
    --skill.nCostMana      	= 0;					-- �������ĵ�����
    --skill.nCostRage		= 0;					-- �������ĵ�ŭ��
    --skill.nCostStamina	= 0;					-- �������ĵ�����
    --skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 9* LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    skill.nChannelInterval		= 86; 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	nWeaponDamagePercent		= 1024;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com