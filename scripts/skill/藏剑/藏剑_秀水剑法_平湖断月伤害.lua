---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��ˮ����_ƽ������.lua
-- ����ʱ��:	2013/5/12 14:13:47
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��ˮ����_ƽ������.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��ˮ����
-- ��������  :  ������
-- ����Ч��  :  ƽ�����£�һ������ˮ�棬���±����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 15, nCostRage = 0, nDamageBase = 93, 		nDamageRand = 3}, -- Level 1 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 99, 		nDamageRand = 4}, -- Level 2 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 105, 		nDamageRand = 4}, -- Level 3 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 111, 		nDamageRand = 5}, -- Level 4 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 117, 		nDamageRand = 6}, -- Level 5 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 123, 		nDamageRand = 7}, -- Level 6 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 129, 		nDamageRand = 7}, -- Level 7 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 135, 		nDamageRand = 8}, -- Level 8 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 141, 		nDamageRand = 9}, -- Level 9 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 147, 		nDamageRand = 9}, -- Level 10 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 153, 		nDamageRand = 10},   	-- Level 11
	{nAddRage = 15, nCostRage = 0, nDamageBase = 155, 		nDamageRand = 11}, -- Level 12
	{nAddRage = 15, nCostRage = 0, nDamageBase = 157, 	nDamageRand = 11}, -- Level 13
	{nAddRage = 15, nCostRage = 0, nDamageBase = 159, 	nDamageRand = 12}, -- Level 14
	{nAddRage = 15, nCostRage = 0, nDamageBase = 161, 	nDamageRand = 13}, -- Level 15
	{nAddRage = 15, nCostRage = 0, nDamageBase = 163, 	nDamageRand = 14}, -- Level 16
	{nAddRage = 15, nCostRage = 0, nDamageBase = 165, 	nDamageRand = 14}, -- Level 17
	{nAddRage = 15, nCostRage = 0, nDamageBase = 167, 	nDamageRand = 15}, -- Level 18
	{nAddRage = 15, nCostRage = 0, nDamageBase = 169, 	nDamageRand = 16}, -- Level 19
	{nAddRage = 15, nCostRage = 0, nDamageBase = 171, 	nDamageRand = 16}, -- Level 20
	{nAddRage = 15, nCostRage = 0, nDamageBase = 173, 	nDamageRand = 17}, -- Level 21
	{nAddRage = 15, nCostRage = 0, nDamageBase = 175, 	nDamageRand = 18}, -- Level 22
	{nAddRage = 15, nCostRage = 0, nDamageBase = 177, 	nDamageRand = 18}, -- Level 23
	{nAddRage = 15, nCostRage = 0, nDamageBase = 181, 	nDamageRand = 19}, -- Level 24 
	{nAddRage = 15, nCostRage = 0, nDamageBase = 188, 	nDamageRand = 20}, -- Level 25
	{nAddRage = 15, nCostRage = 0, nDamageBase = 195, 	nDamageRand = 21}, -- Level 26
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
	--skill.SetNormalCoolDown(1, 355);
	--skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 11 then
		skill.nChannelInterval = 16*1.1;
	elseif dwSkillLevel < 26 then
		skill.nChannelInterval = (16 + (dwSkillLevel -10) * 2)*1.1
	else
		skill.nChannelInterval = 48*1.1;     -- ͨ�������ʱ��   
	end
	--skill.nChannelInterval = 48;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;							--����ʩ�����뾶
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
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
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