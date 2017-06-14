---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_������_�����.lua
-- ����ʱ��:	2013/4/22 16:06:31
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_������-�����.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-3 
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  �����
-- ����Ч��  :  һ��ʱ���ڹ����������,������ʱ���ӹ����߳��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 14, nBuffID = 199, nBuffLevel = 1}, -- Level 1
	{nCostMana = 21, nBuffID = 199, nBuffLevel = 2}, -- Level 2
	{nCostMana = 27, nBuffID = 199, nBuffLevel = 3}, -- Level 3
	{nCostMana = 32, nBuffID = 199, nBuffLevel = 4}, -- Level 4
	{nCostMana = 38, nBuffID = 199, nBuffLevel = 5}, -- Level 5
	{nCostMana = 43, nBuffID = 199, nBuffLevel = 6}, -- Level 6
};               


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_������_�����.lua", -- ����ֵ1
		0														-- ����ֵ2
		);
	--[[
	skill.AddAttribute(						-- 2009.6.30���� ���ö���CD  ����6���ڹ� --CBG
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1125,
		1
		);
	--]]
	

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 106);		--CD40��
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 136;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--player.CastSkill(4094, 3)
	if player.GetKungfuMount().dwSkillID == 10026 then
		player.AddBuff(dwCharacterID, player.nLevel, 5661, 1, 1)	--��ѩ
	else
		player.AddBuff(dwCharacterID, player.nLevel, 199, 1, 1)
		player.CastSkill(4094, 3)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com