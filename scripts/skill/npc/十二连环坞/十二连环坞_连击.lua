------------------------------------------------
-- �ļ���    :  ʮ��������_����.lua
-- ������    :  �²���	
-- ����ʱ��  :  2008-08-27
-- ��;(ģ��):  �书����
-- �书����  :  ʮ��������
-- �书����  :  �⹦
-- ��������  :  ����
-- ����Ч��  :  ��Ŀ��������ο�����ͨ����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{       { nCostMana = 0, nDamageRand = 0},		-- Level 1
        { nCostMana = 0, nDamageRand = 0},		-- Level 2
        { nCostMana = 0, nDamageRand = 0},		-- Level 3
        { nCostMana = 0, nDamageRand = 0},		-- Level 4
        { nCostMana = 0, nDamageRand = 0},		-- Level 5
        { nCostMana = 0, nDamageRand = 0},		-- Level 6
        { nCostMana = 0, nDamageRand = 0},		-- Level 7
	{ nCostMana = 0, nDamageRand = 0},		-- Level 8
	{ nCostMana = 0, nDamageRand = 0},		-- Level 9
	{ nCostMana = 0, nDamageRand = 0},		-- Level 10
	{ nCostMana = 0, nDamageRand = 0},		-- Level 11
        { nCostMana = 0, nDamageRand = 0},		-- Level 12
        { nCostMana = 0, nDamageRand = 0},		-- Level 13
        { nCostMana = 0, nDamageRand = 0},		-- Level 14
        { nCostMana = 0, nDamageRand = 0},		-- Level 15
};



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		5,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		0,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	
      skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		276,
		1
	); 
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--����CD1��
 
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	--skill.nWeaponDamagePercent	= 1024;
	
    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
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