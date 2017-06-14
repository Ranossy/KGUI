---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��ˮ����_�����´�.lua
-- ����ʱ��:	2013/5/12 14:14:31
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_�����´�.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��ˮ����
-- ��������  :  �����´�
-- ����Ч��  :  �����´䣬������ˮ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 20, nCostRage = 0, nDamageBase = 48, 	nDamageRand = 4}, -- Level 1 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 66, 	nDamageRand = 6}, -- Level 2 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 75, 	nDamageRand = 7}, -- Level 3 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 90, 	nDamageRand = 8}, -- Level 4 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 96, 	nDamageRand = 9}, -- Level 5 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 111, 	nDamageRand = 11}, -- Level 6 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 120, 	nDamageRand = 12}, -- Level 7 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 125, 	nDamageRand = 13}, -- Level 8 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 128, 	nDamageRand = 15}, -- Level 9 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 141, 	nDamageRand = 16}, -- Level 10 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 154, 	nDamageRand = 17},   	-- Level 11
	{nAddRage = 20, nCostRage = 0, nDamageBase = 167, 	nDamageRand = 19}, -- Level 12
	{nAddRage = 20, nCostRage = 0, nDamageBase = 180, 	nDamageRand = 20}, -- Level 13
	{nAddRage = 20, nCostRage = 0, nDamageBase = 193, 	nDamageRand = 21}, -- Level 14
	{nAddRage = 20, nCostRage = 0, nDamageBase = 206, 	nDamageRand = 22}, -- Level 15
	{nAddRage = 20, nCostRage = 0, nDamageBase = 219, 	nDamageRand = 24}, -- Level 16
	{nAddRage = 20, nCostRage = 0, nDamageBase = 232, 	nDamageRand = 25}, -- Level 17
	{nAddRage = 20, nCostRage = 0, nDamageBase = 245, 	nDamageRand = 26}, -- Level 18
	{nAddRage = 20, nCostRage = 0, nDamageBase = 258, 	nDamageRand = 28}, -- Level 19
	{nAddRage = 20, nCostRage = 0, nDamageBase = 271, 	nDamageRand = 29}, -- Level 20
	{nAddRage = 20, nCostRage = 0, nDamageBase = 284, 	nDamageRand = 30}, -- Level 21
	{nAddRage = 20, nCostRage = 0, nDamageBase = 297, 	nDamageRand = 32}, -- Level 22
	{nAddRage = 20, nCostRage = 0, nDamageBase = 310, 	nDamageRand = 33}, -- Level 23
	{nAddRage = 20, nCostRage = 0, nDamageBase = 323, 	nDamageRand = 34}, -- Level 24 
	{nAddRage = 20, nCostRage = 0, nDamageBase = 336, 	nDamageRand = 35}, -- Level 25
	{nAddRage = 20, nCostRage = 0, nDamageBase = 349, 	nDamageRand = 37}, -- Level 26

};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/3,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/3,
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
	--skill.SetPublicCoolDown(16);		
	--skill.SetNormalCoolDown(1, 335);
	--skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 11 then
		skill.nChannelInterval = 16;
	elseif dwSkillLevel < 26 then
		skill.nChannelInterval = 16 + (dwSkillLevel -10) * 5
	else
		skill.nChannelInterval = 112;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 112;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 6 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 1024;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID, dwSkillSrcID)
end
--
--function UnApply(dwCharacterID)
--end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com