---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_������_������.lua
-- ����ʱ��:	2013/6/7 5:01:30
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_������_������.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-02-26 16:14	
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ������
-- ����Ч��  :  �ڲ�ͬ�ڹ���Ч����ͬ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 13, nBuffLevel = 1}, -- Level 1
	{nCostMana = 21, nBuffLevel = 2}, -- Level 2
	{nCostMana = 28, nBuffLevel = 3}, -- Level 3
	{nCostMana = 35, nBuffLevel = 4}, -- Level 4
	{nCostMana = 42, nBuffLevel = 5}, -- Level 5
	{nCostMana = 49, nBuffLevel = 6}, -- Level 6
	{nCostMana = 49, nBuffLevel = 7}, -- Level 6
	{nCostMana = 49, nBuffLevel = 8}, -- Level 6
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	
	--ʩ�� ������_��Ѫս�� ID=444
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		444,
		dwSkillLevel
	);
	
--	--ʩ�� ������_������ ID=445
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		445,
--		dwSkillLevel
--	);

	skill.BindBuff(1, 362, tSkillData[dwSkillLevel].nBuffLevel);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 94);
	skill.SetNormalCoolDown(2, 259);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 600;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius = 30 * LENGTH_BASE;
	skill.nTargetCountLimit = 30;
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
	--skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
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