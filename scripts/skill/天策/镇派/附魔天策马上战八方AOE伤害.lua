---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����﷨_ս�˷�.lua
-- ����ʱ��:	2013/6/3 0:59:32
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_ս�˷�.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-06
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ս�˷�
-- ����Ч��  :  ��Χ����,������Ϊ���ĵ�ǹԲ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamage = 35*0.95, 	nDamageRand = 35*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 41*0.95, 	nDamageRand = 41*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 46*0.95, 	nDamageRand = 46*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 51*0.95, 	nDamageRand = 51*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 56*0.95, 	nDamageRand = 56*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 61*0.95, 	nDamageRand = 61*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 67*0.95, 	nDamageRand = 67*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 72*0.95, 	nDamageRand = 72*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 77*0.95, 	nDamageRand = 77*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 82*0.95, 	nDamageRand = 82*0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 87*0.95, 	nDamageRand = 87*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 93*0.95, 	nDamageRand = 93*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 98*0.95, 	nDamageRand = 98*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 103*0.95, 	nDamageRand = 103*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 108*0.95, 	nDamageRand = 108*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 113*0.95, 	nDamageRand = 113*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 119*0.95, 	nDamageRand = 119*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 124*0.95, 	nDamageRand = 124*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 129*0.95, 	nDamageRand = 129*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 134*0.95, 	nDamageRand = 134*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 139*0.95, 	nDamageRand = 139*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 145*0.95, 	nDamageRand = 145*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 150*0.95, 	nDamageRand = 150*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 155*0.95, 	nDamageRand = 155*0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 160*0.95, 	nDamageRand = 160*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 165*0.95, 	nDamageRand = 165*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 171*0.95, 	nDamageRand = 171*0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 176*0.95, 	nDamageRand = 176*0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 181*0.95, 	nDamageRand = 181*0.1, }, -- Level 29
};


tPit = 
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
   	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
   	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}   
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent),
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
	-- skill.SetNormalCoolDown(1, 104);	-- 2008��5��23�ոİ棬��Ϊ��CD
	--skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 683;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent = 1024;
	
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
    
	skill.nAreaRadius = 6 * LENGTH_BASE;	-- 2008��5��23����8�׸�Ϊ6��
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 32*0.5*1.2;
 	elseif dwSkillLevel < 29 then
  		skill.nChannelInterval =(32 + (dwSkillLevel - 9) * 3)*0.5*1.2
  	else
  		skill.nChannelInterval =100*0.5*1.2;     -- ͨ�������ʱ��   
 	end
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	skill.nTargetCountLimit = 5;
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	--[[
	if player.GetSkillLevel(5669) ~= 1 then
		return nPreResult;
	else
		return false
	end
	--]]
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com