------------------------------------------------
-- �ļ���    :  ���½�_�ɻ�����.lua
-- ������    :  �²���	
-- ����ʱ��  :  2008-08-27
-- ��;(ģ��):  �书����
-- �书����  :  ���½�
-- �书����  :  �⹦
-- �书��·  :  MPC����
-- ��������  :  �ɻ�����
-- ����Ч��  :  ��Զ��Ŀ�����X���⹦�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nCostMana = 0, nDamage = 9 },		-- Level 1
	{ nCostMana = 0, nDamage = 15 },		-- Level 2
	{ nCostMana = 0, nDamage = 22 },		-- Level 3
	{ nCostMana = 0, nDamage = 35 },		-- Level 4
	{ nCostMana = 0, nDamage = 44 },		-- Level 5
	{ nCostMana = 0, nDamage = 56 },		-- Level 6
	{ nCostMana = 0, nDamage = 70 },		-- Level 7
	{ nCostMana = 0, nDamage = 88 },		-- Level 8
	{ nCostMana = 0, nDamage = 103 },		-- Level 9
	{ nCostMana = 0, nDamage = 128},		-- Level 10
	{ nCostMana = 0, nDamage = 143 },		-- Level 11
	{ nCostMana = 0, nDamage = 188 },		-- Level 12
	{ nCostMana = 0, nDamage = 243 },		-- Level 13
	{ nCostMana = 0, nDamage = 337 },		-- Level 14
	{ nCostMana = 0, nDamage = 438 },		-- Level 15
};



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
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
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------

    skill.nMinRadius		= 5 * LENGTH_BASE;	--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;	      --����ʩ�����뾶
    skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
 
   
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