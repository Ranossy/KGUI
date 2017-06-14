------------------------------------------------
-- �ļ���    :  ����_�޺�����_��ɨ����
-- ������    :  �º���
-- ����ʱ��  :  2008-07-18
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �޺�����
-- ��������  :  ��ɨ����
-- ����Ч��  :  ����Χ5��Ŀ������˺�������������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 36, 	nDamageRand = 0}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 39, 	nDamageRand = 0}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 41, 	nDamageRand = 0}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 43, 	nDamageRand = 0}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 45, 	nDamageRand = 0}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, 	nDamageRand = 0}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 47, 	nDamageRand = 0}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 48, 	nDamageRand = 0}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, 	nDamageRand = 0}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 50, 	nDamageRand = 0}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 51, 	nDamageRand = 0}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 52, 	nDamageRand = 0}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 53, 	nDamageRand = 0}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, 	nDamageRand = 0}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55, 	nDamageRand = 0}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 56, 	nDamageRand = 0}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 57, 	nDamageRand = 0}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, 	nDamageRand = 0}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 59, 	nDamageRand = 0}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 60, 	nDamageRand = 0}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61, 	nDamageRand = 0}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 62, 	nDamageRand = 0}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 63, 	nDamageRand = 0}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 64, 	nDamageRand = 0}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 66, 	nDamageRand = 0}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 68, 	nDamageRand = 0}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 71, 	nDamageRand = 0}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, 	nDamageRand = 0}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, nDamageRand = 0}, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 36, 	nDamageRand = 0}, -- Level 1 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 39, 	nDamageRand = 0}, -- Level 2 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 41, 	nDamageRand = 0}, -- Level 3 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 43, 	nDamageRand = 0}, -- Level 4 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 45, 	nDamageRand = 0}, -- Level 5 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, 	nDamageRand = 0}, -- Level 6 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 47, 	nDamageRand = 0}, -- Level 7 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 48, 	nDamageRand = 0}, -- Level 8 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, 	nDamageRand = 0}, -- Level 9 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 50, 	nDamageRand = 0}, -- Level 10 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 51, 	nDamageRand = 0}, -- Level 11+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 52, 	nDamageRand = 0}, -- Level 12+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 53, 	nDamageRand = 0}, -- Level 13+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, 	nDamageRand = 0}, -- Level 14+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55, 	nDamageRand = 0}, -- Level 15+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 56, 	nDamageRand = 0}, -- Level 16+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 57, 	nDamageRand = 0}, -- Level 17+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, 	nDamageRand = 0}, -- Level 18+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 59, 	nDamageRand = 0}, -- Level 19+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 60, 	nDamageRand = 0}, -- Level 20+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61, 	nDamageRand = 0}, -- Level 21+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 62, 	nDamageRand = 0}, -- Level 22+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 63, 	nDamageRand = 0}, -- Level 23+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 64, 	nDamageRand = 0}, -- Level 24 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 66, 	nDamageRand = 0}, -- Level 25+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 68, 	nDamageRand = 0}, -- Level 26+29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 71, 	nDamageRand = 0}, -- Level 27 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, 	nDamageRand = 0}, -- Level 28 +29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, 	nDamageRand = 0}, -- Level 29+29
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	

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
--[[����100%�����˺� 
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
		-512,
		0
	);--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);
--    skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CALL_BUFF,
--		3868,
--		1
--	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
    skill.AddSlowCheckSelfBuff(3868, 1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    skill.BindBuff(1, 743, dwSkillLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetPublicCoolDown(16);
    --skill.SetNormalCoolDown(1, 69);
	--skill.SetCheckCoolDown(1, 444);
   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
    --skill.nCostRage		= 0;					-- �������ĵ�ŭ��
    --skill.nCostStamina	= 0;					-- �������ĵ�����
    --skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/10)*139;	-- �������ĵ�����
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 6;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶 
 	skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    skill.nChannelInterval	= 70*1.2*1.5*1.15; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent		= 1024;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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