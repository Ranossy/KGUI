------------------------------------------------
-- �ļ���    :  ���_�����滨��.lua
-- ������    :  ���	
-- ����ʱ��  :  2008-07-7 11:22	
-- ��;(ģ��):  ���������BOSS����
-- �书����  :  BOSS����
-- �书����  :  �⹦
-- �书��·  :  
-- ��������  :  �����滨��
-- ����Ч��  :  Ⱥ��AOE��˲����������Χ10���ڵĳ�޳���б������Һ�NPC���һ������DEBUFF����DEBUFFΪһ���ж�����12�룬DEBUFF�Ƴ���ʱ�����1000�㶾���˺�����Ҫ�������12����Ϊ������ɢ��


--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData =
{
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.BindBuff(1, 664,1);
	
	--[[
	--ʩ�� �Ӽ��� ��������״̬��,�����Ƽ�Ч��,�����������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		664,										
		1
	);
	--]]
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nWeaponDamagePercent		= 0;
	skill.nMinRadius		= 0											--����ʩ����С�뾶
	skill.nMaxRadius        = 10 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
    skill.nAreaRadius      	= 10 * LENGTH_BASE; 										--ʩ�ŽǶ�,ȫ��256
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