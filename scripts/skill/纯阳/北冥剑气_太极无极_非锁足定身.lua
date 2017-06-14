---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_̫���޼�_�����㶨��.lua
-- ����ʱ��:	2013/5/11 16:15:45
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��ڤ����_̫���޼�.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��ڤ����
-- ��������  :  ̫���޼�
-- ����Ч��  :  �����˺�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 6, nDamageRand = 2}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 16, nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 18, nDamageRand = 5}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 20, nDamageRand = 6}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 22, nDamageRand = 8}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 24, nDamageRand = 9}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 26, nDamageRand = 11}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 28, nDamageRand = 12}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 30, nDamageRand = 13}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 31, nDamageRand = 15}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 32, nDamageRand = 16}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 33, nDamageRand = 18}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 34, nDamageRand = 19}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 35, nDamageRand = 20}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 36, nDamageRand = 22}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 37, nDamageRand = 23}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 38, nDamageRand = 25}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 39, nDamageRand = 26}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 40, nDamageRand = 27}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 41, nDamageRand = 29}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 42, nDamageRand = 30}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 43, nDamageRand = 32}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 44, nDamageRand = 33}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 45, nDamageRand = 34}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 46, nDamageRand = 36}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 47, nDamageRand = 37}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 48, nDamageRand = 39}, -- Level 27 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 49, nDamageRand = 40}, -- Level 28 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 50, nDamageRand = 41}, -- Level 29 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 51, nDamageRand = 43}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 52, nDamageRand = 44}, -- Level 31
	{nAddRage = 0, nCostRage = 0, nDamageBase = 53, nDamageRand = 46}, -- Level 32
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
   			
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
		0,
		0
	);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_BUFF,
		2337, -- 2��
		1																-- 
	);
   		   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
	);
	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckDestOwnBuff(6424, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	
	--skill.AddSlowCheckSelfBuff(2337, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	-- ����CD
	--skill.SetNormalCoolDown(1, 461);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 30 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 8*0.8*1.1;
	elseif dwSkillLevel < 32 then
		skill.nChannelInterval = (8 + (dwSkillLevel - 9) * 2)*0.8*1.1
	else
		skill.nChannelInterval = 100*0.8*1.1;     -- ͨ�������ʱ��   
	end
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
       
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