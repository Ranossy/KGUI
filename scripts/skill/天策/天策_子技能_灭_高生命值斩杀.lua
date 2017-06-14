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
	{nCostLife = 139, nDamage = 125*0.95, 	nDamageRand = 125*0.1,  nDebuffLevel = 1},		-- Level 1
	{nCostLife = 161, nDamage = 132*0.95, 	nDamageRand = 132*0.1,  nDebuffLevel = 1},		-- Level 2
	{nCostLife = 183, nDamage = 138*0.95, 	nDamageRand = 138*0.1,  nDebuffLevel = 1},		-- Level 3
	{nCostLife = 205, nDamage = 145*0.95, 	nDamageRand = 145*0.1,  nDebuffLevel = 1},		-- Level 4 
	{nCostLife = 227, nDamage = 151*0.95, 	nDamageRand = 151*0.1,  nDebuffLevel = 1},		-- Level 5
	{nCostLife = 242, nDamage = 158*0.95, 	nDamageRand = 158*0.1,  nDebuffLevel = 1},		-- Level 6
	{nCostLife = 139, nDamage = 164*0.95, 	nDamageRand = 164*0.1,  nDebuffLevel = 1},		-- Level 7
	{nCostLife = 161, nDamage = 171*0.95, 	nDamageRand = 171*0.1,  nDebuffLevel = 1},		-- Level 8
	{nCostLife = 183, nDamage = 177*0.95, 	nDamageRand = 177*0.1,  nDebuffLevel = 1},		-- Level 9
	{nCostLife = 205, nDamage = 184*0.95, 	nDamageRand = 184*0.1,  nDebuffLevel = 1},		-- Level 10 
	{nCostLife = 227, nDamage = 190*0.95, 	nDamageRand = 190*0.1,  nDebuffLevel = 1},		-- Level 11
	{nCostLife = 242, nDamage = 197*0.95, 	nDamageRand = 197*0.1,  nDebuffLevel = 1},		-- Level 12
	{nCostLife = 139, nDamage = 203*0.95, 	nDamageRand = 203*0.1,  nDebuffLevel = 1},		-- Level 13
	{nCostLife = 161, nDamage = 210*0.95, 	nDamageRand = 210*0.1,  nDebuffLevel = 1},		-- Level 14
	{nCostLife = 183, nDamage = 216*0.95, 	nDamageRand = 216*0.1,  nDebuffLevel = 1},		-- Level 15
	{nCostLife = 205, nDamage = 223*0.95, 	nDamageRand = 223*0.1,  nDebuffLevel = 1},		-- Level 16 
	{nCostLife = 227, nDamage = 229*0.95, 	nDamageRand = 229*0.1,  nDebuffLevel = 1},		-- Level 17
	{nCostLife = 242, nDamage = 236*0.95, 	nDamageRand = 236*0.1,  nDebuffLevel = 1},		-- Level 18
	{nCostLife = 139, nDamage = 242*0.95, 	nDamageRand = 242*0.1,  nDebuffLevel = 1},		-- Level 19
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage/4, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/4, 
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
	skill.SetNormalCoolDown(1, 609);
	
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
	
	skill.nWeaponDamagePercent	= 1024/4;
	
	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 20 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    if dwSkillLevel < 10 then
  		skill.nChannelInterval = 70*0.4;
 	elseif dwSkillLevel < 19 then
  		skill.nChannelInterval =(70 + (dwSkillLevel - 9) * 10)*0.4
  	else
  		skill.nChannelInterval =170*0.4;     -- ͨ�������ʱ��   
 	end   
	--skill.nPrepareFrames    = 170;										--����֡��,16֡����1��
    
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