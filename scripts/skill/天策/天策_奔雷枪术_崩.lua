------------------------------------------------
-- �ļ���    :  ���_����ǹ��_��.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-09-06
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ��
-- ����Ч��  :  �˺�����,���Ŀ��ʩ��,����ɹ������3���˺�,��ֹʹ�ü���5��.
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 40, nDamage = 78 *0.95, nDamageRand = 78 *0.1},		-- Level 1	
	{nCostMana = 51, nDamage = 99 *0.95, nDamageRand = 99 *0.1},		-- Level 2  
	{nCostMana = 62, nDamage = 120*0.95, nDamageRand = 120*0.1},		-- Level 3  
	{nCostMana = 73, nDamage = 141*0.95, nDamageRand = 141*0.1},		-- Level 4  
	{nCostMana = 84, nDamage = 162*0.95, nDamageRand = 162*0.1}		-- Level 5  
  
};



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= 5;
	

	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--����CD1��
    skill.SetNormalCoolDown(1, 190);
    skill.SetNormalCoolDown(2, 259);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
skill.nCostManaBasePercent = 137;	-- �������ĵ�����
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nWeaponDamagePercent	= 1024;
	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
	skill.nBreakRate	= 1024;									--���ʩ������
  	--skill.nChannelInterval	= 32;									--2��AP�ӳ�
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