---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����﷨_�ϻ��.lua
-- ����ʱ��:	2013/5/28 21:16:13
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�����﷨_�ϻ��.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-06
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  �����﷨
-- ��������  :  �ϻ��.
-- ����Ч��  :  ���һ���ƶ�����,���ٳ������,��������˺����������,
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

-- ��8��
tSkillData = 
{
	{nCostMana = 35, nDashSpeed = 100}, -- Level 1 nDashSpeed ����ٶȵ�λ ��/֡
	{nCostMana = 53, nDashSpeed = 100}, -- Level 2
	{nCostMana = 78, nDashSpeed = 100}, -- Level 3
	{nCostMana = 98, nDashSpeed = 100}, -- Level 4
	{nCostMana = 117, nDashSpeed = 100}, -- Level 5
	{nCostMana = 137, nDashSpeed = 100}, -- Level 6
	{nCostMana = 157, nDashSpeed = 100}, -- Level 7

};              


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;
--���ִ�нű�,DelMultiGroupBuffByFunctionType��ɢ�����ƶ�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/���/���_�����﷨_�ϻ��.lua",
		0
	);

	--2009-6-26  ȥ�� �����ƶ����� (CBG)
--����entrap
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		541,
		1
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
--�Ӽ��� �ӵ��˺�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		409,
		dwSkillLevel
	);
	

	

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		-- ����CD1��
	skill.SetNormalCoolDown(1, 105);		-- CD20��
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 167;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 8 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
    
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

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(6511) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6122, 1, 1)
	end
	--]]
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com