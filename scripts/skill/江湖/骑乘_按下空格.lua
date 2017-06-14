---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���_���¿ո�.lua
-- ����ʱ��:	2014/12/16 22:47:42
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/���_���¿ո�.lua",
		0														
	);
    
	-- skill.nCostMana			= 0;
	skill.SetCheckCoolDown(1, 444)
	--------------- ����������� ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0;										--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
	skill.nAreaRadius = 25 * LENGTH_BASE;
	
	--skill.nPrepareFrames = 48;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	return true;
end

function CanCast(player, nPreResult)    
	local item = player.GetEquippedHorse()
	if not item then		
		return false;
	end
	return nPreResult;		
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then 
		return
	end
	local nItem = cPlayer.GetEquippedHorse()
	if not nItem then
		return
	end

	if nItem.dwIndex == 13148 then--�ڹ�
		local buff1 = cPlayer.GetBuff(8706, 1)--��ʱ
		if buff1 then
			return
		end
		
		local buff2 = cPlayer.GetBuff(8703, 1)--������
		if not buff2 then
			cPlayer.CastSkill(13619, 1)--����������
		else
			cPlayer.CastSkill(13620, 1)--�������쿪
		end
	elseif nItem.dwIndex == 13788 then--���1
		cPlayer.CastSkill(13999, 1)
	elseif nItem.dwIndex == 13789 then--���2
		cPlayer.CastSkill(14000, 1)
	elseif nItem.dwIndex == 13790 then--���3
		cPlayer.CastSkill(14001, 1)
	elseif nItem.dwIndex == 16894 then--��ţ
		cPlayer.CastSkill(15496, 1)
	elseif nItem.dwIndex == 20986 then--����
		cPlayer.CastSkill(17506, 1)
	elseif nItem.dwIndex == 21073 then--�ǳ�
		cPlayer.CastSkill(17803, 1)
	else
		cPlayer.CastSkill(48, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com