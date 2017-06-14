------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_��Ϫ����.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��ˮ����
-- ��������  :  ��Ϫ����
-- ����Ч��  :  Ϫˮ�������̣������ھ�Ϫʮ�˽�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 22, 	nDamageRand = 6}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 23, 	nDamageRand = 6}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 26, 	nDamageRand = 6}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 27, 	nDamageRand = 6}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 29, 	nDamageRand = 6}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 31, 	nDamageRand = 6}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 33, 	nDamageRand = 6}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 35, 	nDamageRand = 6}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 37, 	nDamageRand = 6}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 39, 	nDamageRand = 6}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, 	nDamageRand = 6},   	-- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 41, 	nDamageRand = 6}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 42, 	nDamageRand = 6}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 43, 	nDamageRand = 6}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, 	nDamageRand = 6}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 45, 	nDamageRand = 6}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 46, 	nDamageRand = 6}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 47, 	nDamageRand = 6}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 48, 	nDamageRand = 6}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, 	nDamageRand = 6}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 50, 	nDamageRand = 6}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 51, 	nDamageRand = 8}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 52, 	nDamageRand = 8}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 53, 	nDamageRand = 8}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, 	nDamageRand = 8}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55, 	nDamageRand = 8}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 56, 	nDamageRand = 10}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 57, 	nDamageRand = 10}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 58, 	nDamageRand = 10}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 59, 	nDamageRand = 10}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 60, 	nDamageRand = 10}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61, 	nDamageRand = 10}, -- Level 32 
	
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

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

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 333);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	-----------------����ʩ�ż�������-------------------------------------------
	skill.AddCheckSelfLearntSkill(14603, 0, SKILL_COMPARE_FLAG.EQUAL);    --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 16*1.1;
	elseif dwSkillLevel < 32 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 4) * 1)*1.1
	else
		skill.nChannelInterval = 48*1.1;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval	= 48;
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius		= 6 * LENGTH_BASE;	
	skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	skill.nTargetCountLimit	= 10;
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

--function Apply(dwCharacterID)
--	local player = GetPlayer(dwCharacterID)
--	
--
--	player.DelMultiGroupBuffByFunctionType(4);
--	player.DelMultiGroupBuffByFunctionType(6);
--	player.DelMultiGroupBuffByFunctionType(8);
--	player.DelMultiGroupBuffByFunctionType(7);
--	
--end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com