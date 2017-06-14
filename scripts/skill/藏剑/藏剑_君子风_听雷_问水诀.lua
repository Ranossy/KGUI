---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_���ӷ�_����_��ˮ��.lua
-- ����ʱ��:	2013/7/24 14:16:11
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_���ӷ�_����_��ˮ��.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ���ӷ�
-- ��������  :  ����
-- ����Ч��  :  �������������ȴ�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 94, nDamageRand = 3}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 96, nDamageRand = 4}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 104, nDamageRand = 4}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 110, nDamageRand = 5}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 116, nDamageRand = 5}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 124, nDamageRand = 6}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 132, nDamageRand = 7}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 134, nDamageRand = 7}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 136, nDamageRand = 8}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 138, nDamageRand = 8}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 140, nDamageRand = 9}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 144, nDamageRand = 10}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 150, nDamageRand = 10}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 156, nDamageRand = 11}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 162, nDamageRand = 11}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 168, nDamageRand = 12}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 178, nDamageRand = 13}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 188, nDamageRand = 13}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 198, nDamageRand = 14}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 200, nDamageRand = 14}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 205, nDamageRand = 15}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 210, nDamageRand = 16}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 215, nDamageRand = 16}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 220, nDamageRand = 17}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 225, nDamageRand = 17}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 230, nDamageRand = 18}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 235, nDamageRand = 19}, -- Level 27 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 240, nDamageRand = 19}, -- Level 28 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 245, nDamageRand = 20}, -- Level 29 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 250, nDamageRand = 20}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 255, nDamageRand = 21}, -- Level 31 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 260, nDamageRand = 22}, -- Level 32 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 265, nDamageRand = 22}, -- Level 33 
};           
             
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1894,
--		1
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	--6260�������û��ʵװ�ˣ���ʱû�á�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6260,
		dwSkillLevel
	);--��Ѩ�����˺�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6954,
		dwSkillLevel
	);--90��������˺�
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 344);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 9 then
		skill.nChannelInterval = 16 * 1.1;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 8) * 5) *1.1
	else
		skill.nChannelInterval = 144 * 1.1;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 144;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	skill.nWeaponDamagePercent = 1024;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--	skill.nTargetCountLimit	= 1;
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