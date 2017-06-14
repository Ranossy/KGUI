---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_������_ѩ����.lua
-- ����ʱ��:	2013/5/29 20:42:52
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_������_ѩ����.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2010-03-2
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  ѩ����
-- ����Ч��  :  �������Ų�ѩ��һ���Ǿƿ����Ų�ѩ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 40, nCostRage = 0, nCostLife = 600, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1}, -- Level 1 
	{nAddRage = 42, nCostRage = 0, nCostLife = 600, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1}, -- Level 2 
	{nAddRage = 44, nCostRage = 0, nCostLife = 600, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1}, -- Level 3 
	{nAddRage = 46, nCostRage = 0, nCostLife = 600, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1}, -- Level 4 
	{nAddRage = 48, nCostRage = 0, nCostLife = 600, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1}, -- Level 5 
	{nAddRage = 50, nCostRage = 0, nCostLife = 600, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1}, -- Level 6 
	{nAddRage = 52, nCostRage = 0, nCostLife = 600, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1}, -- Level 7 
	{nAddRage = 54, nCostRage = 0, nCostLife = 600, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1}, -- Level 8 
	{nAddRage = 56, nCostRage = 0, nCostLife = 600, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1}, -- Level 9 
	{nAddRage = 58, nCostRage = 0, nCostLife = 600, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1}   	-- Level 10
};           
             
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		tSkillData[dwSkillLevel].nAddRage,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_RAGE,
		20,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_������_ѩ����.lua",
		0
	);
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		1781,
--		1
--	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		
	skill.SetNormalCoolDown(1, 349);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostLife	= tSkillData[dwSkillLevel].nCostLife;
	
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--	skill.nChannelInterval	= 32;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	--skill.nWeaponDamagePercent	= 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--	skill.nTargetCountLimit	= 1;
	return true;
end


--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������

end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6549) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 2683, 2, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com