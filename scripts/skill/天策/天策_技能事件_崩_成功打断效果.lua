------------------------------------------------
-- �ļ���    :  ���_�����¼�_��_����˺�.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-09-01
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  �����﷨
-- ��������  :  ��
-- ����Ч��  :  ��_����˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 38, nDamage = 70, nDamageRand = 5},		-- Level 1	
	{nCostMana = 51, nDamage = 99 *2*0.95, nDamageRand = 99 *2*0.1},		-- Level 2  
	{nCostMana = 65, nDamage = 120*2*0.95, nDamageRand = 120*2*0.1},		-- Level 3  
	{nCostMana = 79, nDamage = 141*2*0.95, nDamageRand = 141*2*0.1},		-- Level 4  
	{nCostMana = 90, nDamage = 162*2*0.95, nDamageRand = 162*2*0.1}		-- Level 5  
    
};



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	--��  ��ѣ5��

	skill.BindBuff(1,727,1);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
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
    --skill.SetPublicCoolDown(16);		--����CD1��
    --skill.SetNormalCoolDown(2, 103);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nWeaponDamagePercent	= 1024;
	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 30* LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius		= 8* LENGTH_BASE;
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
	skill.nBreakRate	= 0;									--���ʩ������
	skill.nChannelInterval	= 40;									--2��AP�ӳ�
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