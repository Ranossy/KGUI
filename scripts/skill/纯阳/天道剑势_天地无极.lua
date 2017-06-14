---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�������_����޼�.lua
-- ����ʱ��:	2013/12/11 10:28:02
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �������_����޼�.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �������
-- ��������  :  ����޼�
-- ����Ч��  :  ��Ŀ������⹦�˺�������һ��ʹ��һ����ͽ�������������Ч��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 36, nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, nDamageRand = 7}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 118, nDamageRand = 11}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 158, nDamageRand = 15}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 199, nDamageRand = 19}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 240, nDamageRand = 23}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 280, nDamageRand = 28}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 321, nDamageRand = 32}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 362, nDamageRand = 36}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 403, nDamageRand = 40}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 443, nDamageRand = 44}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 484, nDamageRand = 48}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 525, nDamageRand = 52}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 565, nDamageRand = 56}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 606, nDamageRand = 60}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 647, nDamageRand = 64}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 687, nDamageRand = 69}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 728, nDamageRand = 73}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 769, nDamageRand = 77}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 810, nDamageRand = 81}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 850, nDamageRand = 85}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 891, nDamageRand = 89}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 932, nDamageRand = 93}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 972, nDamageRand = 97}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1013, nDamageRand = 101}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1054, nDamageRand = 105}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1095, nDamageRand = 110}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1135, nDamageRand = 114}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1176, nDamageRand = 118}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1217, nDamageRand = 122}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1257, nDamageRand = 126}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1298, nDamageRand = 130}, -- Level 32 
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		2592, -- ��˫Debuff�˺������Ұ���һ���඼����
		dwSkillLevel
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		902, -- ������������buff������һʱʩչ�����ǻ����һ���඼����
		dwSkillLevel
	);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		903, -- ����һ��û�������˺������ǻ����һ�����඼����
		dwSkillLevel
	);
        
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		713, -- ��buff�˺������ǻ����һ�����඼����
		dwSkillLevel
	);  
	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		--337, -- ����ֵ1
		--1													-- ����ֵ2
	--);
   	
	--skill.AddAttribute(
		--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		--338, -- ����ֵ1
		--1													-- ����ֵ2
	--);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--713, -- ��buff�˺�
	--dwSkillLevel
	--);
	--skill.BindBuff(tSkillData[dwSkillLevel].nBuffID, tSkillData[dwSkillLevel].nBuffLevel)
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD
	skill.SetNormalCoolDown(1, 82);	--CD8s
	skill.SetCheckCoolDown(1, 444);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75*0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75*0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75*0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 460 * 0.75 * 0.75;	-- �������ĵ�����
	end

	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;					--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	--skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
	--skill.nWeaponDamagePercent		= 1024;					-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
    
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com