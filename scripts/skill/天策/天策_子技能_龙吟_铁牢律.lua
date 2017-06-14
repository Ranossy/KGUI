------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_����_������.lua
-- ������    :  ����
-- ����ʱ��  :  2008-06-20
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ���_�Ӽ���_����_������
-- ��������  :  ����
-- ����Ч��  :  ������״̬��,������Ŀ�깥����,����ʩ��,����ǰ����Ŀ������˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamage = 37*0.95, 	nDamageRand = 37*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 46*0.95, 	nDamageRand = 46*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 55*0.95, 	nDamageRand = 55*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 64*0.95, 	nDamageRand = 64*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 73*0.95, 	nDamageRand = 73*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 82*0.95, 	nDamageRand = 82*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 91*0.95, 	nDamageRand = 91*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 100*0.95, 	nDamageRand = 100*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 109*0.95, 	nDamageRand = 109*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 118*0.95, 	nDamageRand = 118*0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 127*0.95, 	nDamageRand = 127*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 136*0.95, 	nDamageRand = 136*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 145*0.95, 	nDamageRand = 145*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 154*0.95, 	nDamageRand = 154*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 163*0.95, 	nDamageRand = 163*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 172*0.95, 	nDamageRand = 172*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 181*0.95, 	nDamageRand = 181*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 190*0.95, 	nDamageRand = 190*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 199*0.95, 	nDamageRand = 199*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 208*0.95, 	nDamageRand = 208*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 217*0.95, 	nDamageRand = 217*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 226*0.95, 	nDamageRand = 226*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 235*0.95, 	nDamageRand = 235*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 244*0.95, 	nDamageRand = 244*0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 253*0.95, 	nDamageRand = 253*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 262*0.95, 	nDamageRand = 262*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 271*0.95, 	nDamageRand = 271*0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 280*0.95, 	nDamageRand = 280*0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 289*0.95, 	nDamageRand = 289*0.1, }, -- Level 29
};



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
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


    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent	= 1024;
	
	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    skill.nAreaRadius		= 4 * LENGTH_BASE;		-- �������ð뾶
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   	skill.nTargetCountLimit	= 1;								--�������1��Ŀ��	
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