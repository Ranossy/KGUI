------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_��_������ֵ_����.lua
-- ������    :  ����
-- ����ʱ��  :  2008-08-21
-- �޸�ʱ��  �� 2008-08-21
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ��_������ֵ
-- ����Ч��  :  ����Ѫ�����ڵ���50%֮��,����˺�,���Լ�����⹦�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostLife = 125, nDamage = 125*2*0.95, 	nDamageRand = 125*2*0.1,  nDebuffLevel = 1},		-- Level 1
	{nCostLife = 132, nDamage = 132*2*0.95, 	nDamageRand = 132*2*0.1,  nDebuffLevel = 1},		-- Level 2
	{nCostLife = 138, nDamage = 138*2*0.95, 	nDamageRand = 138*2*0.1,  nDebuffLevel = 1},		-- Level 3
	{nCostLife = 145, nDamage = 145*2*0.95, 	nDamageRand = 145*2*0.1,  nDebuffLevel = 1},		-- Level 4 
	{nCostLife = 151, nDamage = 151*2*0.95, 	nDamageRand = 151*2*0.1,  nDebuffLevel = 1},		-- Level 5
	{nCostLife = 158, nDamage = 158*2*0.95, 	nDamageRand = 158*2*0.1,  nDebuffLevel = 1},		-- Level 6
	{nCostLife = 164, nDamage = 164*2*0.95, 	nDamageRand = 164*2*0.1,  nDebuffLevel = 1},		-- Level 7
	{nCostLife = 171, nDamage = 171*2*0.95, 	nDamageRand = 171*2*0.1,  nDebuffLevel = 1},		-- Level 8
	{nCostLife = 177, nDamage = 177*2*0.95, 	nDamageRand = 177*2*0.1,  nDebuffLevel = 1},		-- Level 9
	{nCostLife = 184, nDamage = 184*2*0.95, 	nDamageRand = 184*2*0.1,  nDebuffLevel = 1},		-- Level 10 
	{nCostLife = 190, nDamage = 190*2*0.95, 	nDamageRand = 190*2*0.1,  nDebuffLevel = 1},		-- Level 11
	{nCostLife = 197, nDamage = 197*2*0.95, 	nDamageRand = 197*2*0.1,  nDebuffLevel = 1},		-- Level 12
	{nCostLife = 203, nDamage = 203*2*0.95, 	nDamageRand = 203*2*0.1,  nDebuffLevel = 1},		-- Level 13
	{nCostLife = 210, nDamage = 210*2*0.95, 	nDamageRand = 210*2*0.1,  nDebuffLevel = 1},		-- Level 14
	{nCostLife = 216, nDamage = 216*2*0.95, 	nDamageRand = 216*2*0.1,  nDebuffLevel = 1},		-- Level 15
	{nCostLife = 223, nDamage = 223*2*0.95, 	nDamageRand = 223*2*0.1,  nDebuffLevel = 1},		-- Level 16 
	{nCostLife = 229, nDamage = 229*2*0.95, 	nDamageRand = 229*2*0.1,  nDebuffLevel = 1},		-- Level 17
	{nCostLife = 236, nDamage = 236*2*0.95, 	nDamageRand = 236*2*0.1,  nDebuffLevel = 1},		-- Level 18
	{nCostLife = 242, nDamage = 242*2*0.95, 	nDamageRand = 242*2*0.1,  nDebuffLevel = 1},		-- Level 19
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;


--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
--		-1024, 
--		0
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nCostLife / 3,
		0
	);
--
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
--		tSkillData[dwSkillLevel].nDamageRand, 
--		0
--	);
--    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);

skill.AddSlowCheckSelfBuff(2854, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(1, 434);
	
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
	
	skill.nWeaponDamagePercent	= 0;
	
	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nChannelInterval	= 32; 									-- ͨ�������ʱ��    
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