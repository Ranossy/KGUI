------------------------------------------------
-- �ļ���    :  �������_��������.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �������
-- ��������  :  ��������
-- ����Ч��  :  ��ͨ����30%��������Ч��50%��Ч������6�룻
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nBuffID = 131, nBuffLevel = 1, nCostMana = 248},	--level 1
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	
	skill.BindBuff(1, 131, tSkillData[dwSkillLevel].nBuffLevel)
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    skill.SetPublicCoolDown(16);	--����CD
    --skill.SetNormalCoolDown(2, 82);	--CD6s
    
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;						--����ʩ�����뾶
    skill.nAngleRange       = 128; 									--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
       
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

--������ħ������ִ�нű�ʱ,Ҫ ���õĺ���; dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	
	
	--player.SetRepresentID(EQUIPMENT_REPRESENT.WEAPON_METEOR, 1)
	--player.SetTimer(20, "scripts/skill/����/�������_��������.lua", 0, 0)
end

function UnApply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	
	--print("SetRepresentID back")
	--player.SetRepresentID(EQUIPMENT_REPRESENT.WEAPON_METEOR, 0)
	--player.SetRepresentID(EQUIPMENT_REPRESENT.WEAPON_ENCHANT2, 0)
end

function OnTimer(player, nParam1, nParam2)
	--print("SetRepresentID")
	--player.SetRepresentID(EQUIPMENT_REPRESENT.WEAPON_ENCHANT2, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com