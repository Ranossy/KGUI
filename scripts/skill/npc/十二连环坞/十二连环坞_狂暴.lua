------------------------------------------------
-- �ļ���    :  ʮ��������_��.lua
-- ������    :  �²���	
-- ����ʱ��  :  2008-08-20
-- ��;(ģ��):  �书����
-- �书����  :  ʮ��������
-- �书����  :  Buff
-- �书��·  :  NPC
-- ��������  :  ��
-- ����Ч��  :  ������������X��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 1 },		-- Level 1
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 2 },		-- Level 2
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 3 },		-- Level 3
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 4 },		-- Level 4
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 5 },		-- Level 5
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 6 },		-- Level 6
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 7 },		-- Level 7
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 8 },		-- Level 8
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 9 },		-- Level 9
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 10 },		-- Level 10
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 11 },		-- Level 11
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 12 },		-- Level 12
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 13 },		-- Level 13
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 14 },		-- Level 14
	{ nCostMana = 0, nBuffID = 410, nBuffLevel = 15 },		-- Level 15
};



function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);
 

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--����CD1��
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
  
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0			--����ʩ����С�뾶
    --skill.nMaxRadius        = 30 * LENGTH_BASE;	--����ʩ�����뾶
    --skill.nAngleRange       = 256; 			--ʩ�ŽǶ�
    
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