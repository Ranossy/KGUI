------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_��_������ֵ.lua
-- ������    :  ����
-- ����ʱ��  :  2008-08-21
-- �޸�ʱ��  �� 2008-08-21
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ��_������ֵ
-- ����Ч��  :  ����Ѫ�����ڵ���50%֮��,����˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostLife = 139, nDamage = 139*0.95, nDamageRand = 139*0.1, nDebuffLevel = 1},		-- Level 1
	{nCostLife = 161, nDamage = 161*0.95, nDamageRand = 161*0.1, nDebuffLevel = 1},		-- Level 2
	{nCostLife = 183, nDamage = 183*0.95, nDamageRand = 183*0.1, nDebuffLevel = 1},		-- Level 3
	{nCostLife = 205, nDamage = 205*0.95, nDamageRand = 205*0.1, nDebuffLevel = 1},		-- Level 4 
	{nCostLife = 227, nDamage = 227*0.95, nDamageRand = 227*0.1, nDebuffLevel = 1},		-- Level 5
	{nCostLife = 242, nDamage = 242*0.95, nDamageRand = 242*0.1, nDebuffLevel = 1},		-- Level 6 
};

tPit =
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
    
    
}   
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage* (1 - tPit[dwSkillLevel].nReducePercent), 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand* (1 - tPit[dwSkillLevel].nReducePercent), 
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.PHYSICS_CRITICAL_STRIKE_BASE_RATE,
		2000, 
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.PHYSICS_SHIELD_PERCENT,
		-256, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);


    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 435);
	skill.AddSlowCheckDestBuff(540,	1,	BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostLife	=	tSkillData[dwSkillLevel].nCostLife;
	----------------- ���ü���ʩ��buff���� ----------------------------------------------------------------------

    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    ----------------- ����Ѫ������ ---------------------------------------------
	skill.nSelfLifePercentMin	= 51;			-- Ѫ����Сֵ>=
	skill.nSelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
	
	skill.nWeaponDamagePercent	= 1024;
	
	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
     	skill.nChannelInterval	= 60; 									-- ͨ�������ʱ��    
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������

	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com